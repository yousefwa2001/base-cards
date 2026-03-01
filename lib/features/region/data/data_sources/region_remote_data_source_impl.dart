import 'package:base_cards/core/constants/app_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/region_model.dart';
import 'region_remote_data_source.dart';

class RegionRemoteDataSourceImpl implements RegionRemoteDataSource {
  final FirebaseFirestore firestore;
  const RegionRemoteDataSourceImpl({required this.firestore});
  @override
  Future<List<RegionModel>> getRegions({
    required String categoryId,
    required bool isSupplier,
  }) async {
    final query = firestore
        .collection(AppCollections.cardCategories)
        .doc(categoryId)
        .collection(AppCollections.region);
    final snapshot =
        isSupplier
            ? await query.get()
            : await query.where('isActive', isEqualTo: true).get();
    return snapshot.docs.map((doc) {
      return RegionModel.fromFirestore(doc.id, doc.data());
    }).toList();
  }
}
