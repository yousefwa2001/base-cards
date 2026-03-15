import 'package:base_cards/core/constants/app_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../adjust_balance/data/models/balance_model.dart';
import 'transactions_remote_data_source.dart';

class TransactionsRemoteDataSourceImpl implements TransactionsRemoteDataSource {
  final FirebaseFirestore firestore;
  const TransactionsRemoteDataSourceImpl({required this.firestore});
  @override
  Future<List<BalanceModel>> getTransactions({required String shopId}) async {
    final snapshot =
        await firestore
            .collection(AppCollections.users)
            .doc(shopId)
            .collection(AppCollections.balanceTransactions)
            .orderBy('at')
            .get();

    return snapshot.docs.map((doc) {
      return BalanceModel.fromFirestore(doc.id, doc.data());
    }).toList();
  }
}
