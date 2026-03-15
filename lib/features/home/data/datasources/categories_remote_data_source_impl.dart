import 'package:base_cards/core/constants/app_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/card_category_model.dart';

import 'categories_remote_data_source.dart';

class CardCategoriesRemoteDataSourceImpl
    implements CardCategoriesRemoteDataSource {
  final FirebaseFirestore firestore;

  CardCategoriesRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<CardCategoryModel>> getAllCategories({
    required bool isSupplier,
  }) async {
    final query = firestore.collection(AppCollections.cardCategories);

    final snapshot =
        isSupplier
            ? await query.get()
            : await query.where('isActive', isEqualTo: true).get();

    return snapshot.docs
        .map(
          (doc) =>
              CardCategoryModel.fromFirestore(id: doc.id, data: doc.data()),
        )
        .toList();
  }
}
