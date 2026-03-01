import 'package:base_cards/core/constants/app_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/purchase_model.dart';
import 'purchase_remote_data_source.dart';

class PurchaseRemoteDataSourceImpl implements PurchaseRemoteDataSource {
  final FirebaseFirestore firestore;
  const PurchaseRemoteDataSourceImpl({required this.firestore});
  @override
  Future<List<PurchaseModel>> getPurchases({required String buyerId}) async {
    final snapshot =
        await firestore
            .collection(AppCollections.users)
            .doc(buyerId)
            .collection(AppCollections.purchases)
            .orderBy('purchasedAt')
            .get();

    return snapshot.docs.map((doc) {
      return PurchaseModel.fromMap(doc.data(), doc.id);
    }).toList();
  }
}
