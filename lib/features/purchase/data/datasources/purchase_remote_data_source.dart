

import '../models/purchase_model.dart';

abstract class PurchaseRemoteDataSource {
  Future<List<PurchaseModel>> getPurchases({required String buyerId});
}
