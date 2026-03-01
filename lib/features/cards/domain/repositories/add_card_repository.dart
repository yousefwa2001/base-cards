import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../card_values/domain/entities/card_value_entity.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/domain/entities/region_entity.dart';

abstract class AddCardRepository {
  Future<Either<Failure, void>> addCard({
    required String cardCode,
    required String serialNumber,
    required CardCategoryEntity category,
    required int? expiryMonth,
    required int? expiryYear,
    required RegionEntity region,
    required CardValueEntity value,
    required String uid,
  });
}
