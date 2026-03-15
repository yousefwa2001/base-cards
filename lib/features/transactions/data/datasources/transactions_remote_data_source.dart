

import '../../../adjust_balance/data/models/balance_model.dart';


abstract class TransactionsRemoteDataSource {
  Future<List<BalanceModel>> getTransactions({required String shopId});
}
