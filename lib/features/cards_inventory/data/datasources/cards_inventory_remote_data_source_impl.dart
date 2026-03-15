import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/app_collections.dart';
import '../../../cards/data/models/card_model.dart';
import 'cards_inventory_remote_data_source.dart';

class CardsInventoryRemoteDataSourceImpl
    implements CardsInventoryRemoteDataSource {
  final FirebaseFirestore firestore;
  const CardsInventoryRemoteDataSourceImpl({required this.firestore});
  @override
  Future<List<CardModel>> getCardsInventory({
    String? categoryId,
    String? regionId,
    String? valueId,
    InventoryStatus status = InventoryStatus.all,
  }) async {
    Query<Map<String, dynamic>> query = firestore.collection(
      AppCollections.cardsInventory,
    );

    if (categoryId != null && categoryId.isNotEmpty) {
      query = query.where('categoryId', isEqualTo: categoryId);
    }
    if (regionId != null && regionId.isNotEmpty) {
      query = query.where('regionId', isEqualTo: regionId);
    }
    if (valueId != null && valueId.isNotEmpty) {
      query = query.where('valueId', isEqualTo: valueId);
    }

    if (status == InventoryStatus.sold) {
      query = query
          .where('isSold', isEqualTo: true)
          .orderBy('soldAt', descending: true);
    } else if (status == InventoryStatus.available) {
      query = query
          .where('isSold', isEqualTo: false)
          .orderBy('createdAt', descending: true);
    } else {
      // All
      query = query.orderBy('isSold').orderBy('createdAt', descending: true);
    }

    final snapshot = await query.get();
    return snapshot.docs.map((d) => CardModel.fromMap(d.data(), d.id)).toList();
  }
}
