import 'package:base_cards/features/card_values/domain/entities/card_value_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class CardValuesRepository {
  Future<Either<Failure, List<CardValueEntity>>> getValuesForCategory({
    required String categoryId,
    required String regionId,
    required bool isSupplier,
  });
  Future<Either<Failure, Unit>> updatePurchasePrice({
    required String categoryId,
    required String regionId,
    required String valueId,
    required int purchasePrice,
  });
}
