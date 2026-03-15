import 'package:base_cards/core/constants/app_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BalanceRemoteDataSource {
  final FirebaseFirestore firestore;

  BalanceRemoteDataSource(this.firestore);

  Stream<int> watchUserBalance(String userId) {
    return firestore
        .collection(AppCollections.users)
        .doc(userId)
        .snapshots()
        .map((snapshot) {
          final data = snapshot.data();
          if (data == null) return 0;
          return (data['balance'] as num).toInt();
        });
  }
}
