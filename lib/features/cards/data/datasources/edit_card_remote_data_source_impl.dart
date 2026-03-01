import 'package:base_cards/core/constants/app_collections.dart';
import 'package:base_cards/core/constants/app_exception.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/card_model.dart';
import 'edit_card_remote_data_source.dart';

class EditCardRemoteDataSourceImpl implements EditCardRemoteDataSource {
  final FirebaseFirestore firestore;

  EditCardRemoteDataSourceImpl({required this.firestore});

  @override
  Future<String> editCardCode({
    required String cardId,
    required String newCode,
    required String serialNumber,
    required int? expiryYear,
    required int? expiryMonth,
  }) async {
    final trimmed = newCode.trim();
    if (trimmed.isEmpty) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        code: 'invalid-code',
        message: 'New code is empty',
      );
    }

    final inventoryRef = firestore.collection(AppCollections.cardsInventory);
    final oldRef = inventoryRef.doc(cardId);

    return firestore.runTransaction<String>((tx) async {
      final oldSnap = await tx.get(oldRef);
      final oldData = oldSnap.data();

      if (!oldSnap.exists || oldData == null) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: 'invalid-card',
          message: 'Card not found',
        );
      }

      final bool isSold = (oldData['isSold'] as bool?) ?? false;
      if (isSold) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: 'already-sold',
          message: 'Cannot edit code for a sold card',
        );
      }

      final String categoryId =
          (oldData['categoryId'] as String?)?.trim() ?? '';
      if (categoryId.isEmpty) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          code: 'invalid-card',
          message: 'Missing categoryId on card document',
        );
      }

      final String oldCode = (oldData['code'] as String?)?.trim() ?? '';
      final String newDocId = '$categoryId$trimmed';

      if (newDocId == cardId) {
        tx.update(oldRef, {
          'previousCode': oldCode,
          ...CardModel.codeUpdateMap(
            newCode: trimmed,
            serialNumber: serialNumber,
            expiryMonth: expiryMonth,
            expiryYear: expiryYear,
          ),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        return cardId;
      }

      final newRef = inventoryRef.doc(newDocId);

      final newSnap = await tx.get(newRef);
      if (newSnap.exists) {
        throw Exception(AppException.codeAlreadyExists);
      }

      final Map<String, dynamic> newData = Map<String, dynamic>.from(oldData)
        ..addAll({
          'previousCode': oldCode,
          ...CardModel.codeUpdateMap(
            newCode: trimmed,
            serialNumber: serialNumber,
            expiryMonth: expiryMonth,
            expiryYear: expiryYear,
          ),
          'updatedAt': FieldValue.serverTimestamp(),
        });

      tx.set(newRef, newData);
      tx.delete(oldRef);

      return newDocId;
    });
  }
}
