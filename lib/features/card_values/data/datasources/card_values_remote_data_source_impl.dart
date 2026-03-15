import 'package:base_cards/core/constants/app_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/card_value_model.dart';
import 'card_values_remote_data_source.dart';

class CardValuesRemoteDataSourceImpl implements CardValuesRemoteDataSource {
  final FirebaseFirestore firestore;
  const CardValuesRemoteDataSourceImpl({required this.firestore});
  @override
  Future<List<CardValueModel>> getValuesForCategory({
    required String categoryId,
    required String regionId,
    required bool isSupplier,
  }) async {
    final query = firestore
        .collection(AppCollections.cardCategories)
        .doc(categoryId)
        .collection(AppCollections.region)
        .doc(regionId)
        .collection(AppCollections.values)
        .orderBy('price');

    final snapshot =
        isSupplier
            ? await query.get()
            : await query.where('isActive', isEqualTo: true).get();

    return snapshot.docs.map((doc) {
      return CardValueModel.fromFirestore(doc.id, doc.data());
    }).toList();
  }

  @override
  Future<void> updatePurchasePrice({
    required String categoryId,
    required String regionId,
    required String valueId,
    required int purchasePrice,
  }) async {
    return await firestore
        .collection(AppCollections.cardCategories)
        .doc(categoryId)
        .collection(AppCollections.region)
        .doc(regionId)
        .collection(AppCollections.values)
        .doc(valueId)
        .update({'purchase_price': purchasePrice});
  }
}
