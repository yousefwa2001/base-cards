import 'package:base_cards/core/constants/app_collections.dart';
import 'package:base_cards/core/enums/balance_direction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/balance_codes.dart';
import '../models/balance_model.dart';
import 'adjust_balance_remote_datasource.dart';

class AdjustBalanceRemoteDataSourceImpl
    implements AdjustBalanceRemoteDataSource {
  final FirebaseFirestore firestore;
  AdjustBalanceRemoteDataSourceImpl({required this.firestore});

  @override
  Future<String> adjustShopBalance({
    required String supplierId,
    required String shopId,
    required int amount,
    required String direction,
    String? note,
  }) async {
    if (amount <= 0) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        code: BalanceCodes.invalidAmount,
        message: 'Amount must be > 0',
      );
    }

    if (direction != 'credit' && direction != 'debit') {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        code: BalanceCodes.invalidDirection,
        message: 'Invalid direction',
      );
    }

    final supplierRef = firestore
        .collection(AppCollections.users)
        .doc(supplierId);
    final shopRef = firestore.collection(AppCollections.users).doc(shopId);

    final txGlobalRef = firestore.collection('transactions').doc();
    final txShopRef = shopRef
        .collection('balance_transactions')
        .doc(txGlobalRef.id);

    return firestore.runTransaction((tx) async {
      final supplierSnap = await tx.get(supplierRef);
      final shopSnap = await tx.get(shopRef);

      if (!supplierSnap.exists) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: BalanceCodes.supplierNotFound,
        );
      }
      if (!shopSnap.exists) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: BalanceCodes.shopNotFound,
        );
      }

      final sData = supplierSnap.data() as Map<String, dynamic>;
      final shData = shopSnap.data() as Map<String, dynamic>;

      if ((sData['role'] ?? '') != 'supplier') {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: BalanceCodes.notSupplier,
        );
      }
      if ((shData['role'] ?? '') != 'shop') {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: BalanceCodes.notShop,
        );
      }

      final int sBal = (sData['balance'] ?? 0) as int;
      final int shBal = (shData['balance'] ?? 0) as int;

      final String supplierName = (sData['name'] ?? '').toString();
      final String shopName = (shData['name'] ?? '').toString();

      late int sAfter;
      late int shAfter;

      if (direction == 'credit') {
        if (sBal < amount) {
          throw FirebaseException(
            plugin: 'cloud_firestore',
            code: BalanceCodes.insufficientSupplier,
          );
        }
        sAfter = sBal - amount;
        shAfter = shBal + amount;
      } else {
        if (shBal < amount) {
          throw FirebaseException(
            plugin: 'cloud_firestore',
            code: BalanceCodes.insufficientShop,
          );
        }
        shAfter = shBal - amount;
        sAfter = sBal + amount;
      }

      tx.update(supplierRef, {'balance': sAfter});
      tx.update(shopRef, {'balance': shAfter});

      final model = BalanceModel(
        id: txGlobalRef.id,
        direction: BalanceDirectionX.fromString(direction),
        supplierId: supplierId,
        supplierName: supplierName,
        shopId: shopId,
        shopName: shopName,
        amount: amount,

        supplierBalanceBefore: sBal,
        supplierBalanceAfter: sAfter,
        shopBalanceBefore: shBal,
        shopBalanceAfter: shAfter,

        note: note,
      );
      final map = model.toMapForCreate();

      tx.set(txGlobalRef, map);
      tx.set(txShopRef, map);

      return txGlobalRef.id;
    });
  }
}
