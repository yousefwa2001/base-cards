import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/card_value_entity.dart';

import '../repositories/card_values_repository.dart';

class CardValuesUseCase {
  final CardValuesRepository repository;

  CardValuesUseCase({required this.repository});

  Future<Either<Failure, List<CardValueEntity>>> call({
    required String categoryId,
    required String regionId,
    required bool isSupplier,
  }) {
    return repository.getValuesForCategory(
      categoryId: categoryId,
      regionId: regionId,
      isSupplier: isSupplier,
    );
  }
}
