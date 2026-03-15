import '../../../auth/data/models/user_model.dart';

abstract class FetchShopsRemoteDatasource {
  Future<List<UserModel>> getShops();
}
