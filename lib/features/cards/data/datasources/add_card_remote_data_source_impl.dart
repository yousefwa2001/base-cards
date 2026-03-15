import 'package:base_cards/core/constants/app_collections.dart';
import 'package:base_cards/core/constants/app_exception.dart';
import 'package:base_cards/features/cards/data/models/card_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_card_remote_data_source.dart';

class AddCardRemoteDataSourceImpl implements AddCardRemoteDataSource {
  final FirebaseFirestore firestore;

  AddCardRemoteDataSourceImpl({required this.firestore});
  @override
  Future<void> addCard({required CardModel cardData}) async {
    final code = cardData.code.trim();
    if (code.isEmpty) throw Exception('Empty code');

    final docRef = firestore
        .collection(AppCollections.cardsInventory)
        .doc("${cardData.categoryId}$code");

    await firestore.runTransaction((tx) async {
      final snap = await tx.get(docRef);
      if (snap.exists) {
        throw Exception(AppException.codeAlreadyExists);
      }

      tx.set(docRef, cardData.toMapForCreate());
    });
  }
}
