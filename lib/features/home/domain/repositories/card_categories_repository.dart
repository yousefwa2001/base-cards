import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/card_category_entity.dart';

abstract class CardCategoriesRepository {
  Future<Either<Failure, List<CardCategoryEntity>>> getAllCategories({
    required bool isSupplier,
  });
}
