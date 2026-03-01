import '../models/card_category_model.dart';

abstract class CardCategoriesRemoteDataSource {
  Future<List<CardCategoryModel>> getAllCategories({required bool isSupplier});
}
