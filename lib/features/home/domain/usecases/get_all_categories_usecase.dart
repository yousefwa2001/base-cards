import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import '../entities/card_category_entity.dart';
import '../repositories/card_categories_repository.dart';

class GetAllCategoriesUseCase
 {
  final CardCategoriesRepository repository;

  GetAllCategoriesUseCase({required this.repository});


  Future<Either<Failure, List<CardCategoryEntity>>> call({required bool isSupplier}) {
    return repository.getAllCategories(isSupplier: isSupplier);
  }
}
