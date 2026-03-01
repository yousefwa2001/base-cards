import '../models/card_value_model.dart';

abstract class CardValuesRemoteDataSource {
  Future<List<CardValueModel>> getValuesForCategory({
    required String categoryId,
    required String regionId,
    required bool isSupplier,
  });
  Future<void> updatePurchasePrice({
    required String categoryId,
    required String regionId,
    required String valueId,
    required int purchasePrice,
  });
}
