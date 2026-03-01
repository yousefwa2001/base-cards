import 'package:base_cards/core/constants/app_collections.dart';
import 'package:base_cards/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'fetch_shops_remote_datasource.dart';

class FetchShopsRemoteDatasourceImpl implements FetchShopsRemoteDatasource {
  final FirebaseFirestore firestore;
  const FetchShopsRemoteDatasourceImpl({required this.firestore});
  @override
  Future<List<UserModel>> getShops() async {
    final snapshot =
        await firestore
            .collection(AppCollections.users)
            .where('role', isEqualTo: 'shop')
            .where('isVerified', isEqualTo: true)
            .get();

    return snapshot.docs.map((doc) {
      return UserModel.fromMap(doc.id, doc.data());
    }).toList();
  }
}
