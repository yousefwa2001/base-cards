import 'package:base_cards/core/constants/app_collections.dart';
import 'package:base_cards/features/card_values/domain/entities/card_value_entity.dart';
import 'package:base_cards/features/home/domain/entities/card_category_entity.dart';
import 'package:base_cards/features/region/domain/entities/region_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../purchase/data/models/purchase_model.dart';
import '../../domain/entities/purchased_card_result.dart';
import '../models/card_model.dart';
import 'buy_card_remote_data_source_impl.dart';

class BuyCardRemoteDataSourceImpl implements BuyCardRemoteDataSource {
  final FirebaseFirestore firestore;

  BuyCardRemoteDataSourceImpl({required this.firestore});
  @override
  Future<PurchasedCardResult> buyAnyAvailableCard({
    required String buyerUid,
    required String buyerName,
    required CardCategoryEntity category,
    required RegionEntity region,
    required CardValueEntity value,
  }) async {
    final userRef = firestore.collection(AppCollections.users).doc(buyerUid);
    final inventoryRef = firestore.collection(AppCollections.cardsInventory);

    final userSnapPre = await userRef.get();
    final currentBalancePre =
        ((userSnapPre.data()?['balance']) as num?)?.toInt() ?? 0.0;

    if (currentBalancePre < value.price) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        code: 'insufficient-balance',
        message: 'Insufficient balance',
      );
    }

    final querySnap =
        await inventoryRef
            .where('categoryId', isEqualTo: category.id)
            .where('regionId', isEqualTo: region.id)
            .where('valueId', isEqualTo: value.id)
            .where('isSold', isEqualTo: false)
            .orderBy('createdAt')
            .limit(1)
            .get();

    if (querySnap.docs.isEmpty) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        code: 'no-cards',
        message: 'No available cards',
      );
    }

    final cardDocRef = querySnap.docs.first.reference;

    return await firestore.runTransaction((tx) async {
      final userSnap = await tx.get(userRef);
      final currentBalance =
          ((userSnap.data()?['balance']) as num?)?.toInt() ?? 0.0;

      if (currentBalance < value.price) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: 'insufficient-balance',
          message: 'Insufficient balance',
        );
      }
      final cardSnap = await tx.get(cardDocRef);
      final data = cardSnap.data();

      if (!cardSnap.exists || data == null) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: 'invalid-card',
          message: 'Card not found',
        );
      }

      final bool isSold = (data['isSold'] as bool?) ?? true;
      if (isSold) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: 'already-sold',
          message: 'Card already sold',
        );
      }

      final String code = (data['code'] as String?)?.trim() ?? '';
      final int? expiryMonth = (data['expiryMonth']);
      final int? expiryYear = (data['expiryYear']);
      final String serialNumber =
          (data['serial_number'] as String?)?.trim() ?? '';

      if (code.isEmpty) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: 'invalid-card',
          message: 'Card code is missing',
        );
      }

      tx.update(
        cardDocRef,
        CardModel.soldUpdateMap(buyerUid: buyerUid, buyerName: buyerName),
      );

      tx.update(userRef, {'balance': currentBalance - value.price});

      final DocumentReference<Map<String, dynamic>> purchaseRef =
          userRef.collection('purchases').doc();

      final PurchaseModel purchase = PurchaseModel(
        cardId: cardDocRef.id,
        code: code,
        serialNumber: serialNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        price: value.price,
        category: category.name,
        categoryId: category.id,
        region: region.name,
        regionId: region.id,
        value: value.value,
        valueId: value.id,
        buyerId: buyerUid,
      );

      tx.set(purchaseRef, purchase.toMapForCreate());

      return PurchasedCardResult(
        cardId: cardDocRef.id,
        code: code,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        serialNumber: serialNumber,
      );
    });
  }
}
