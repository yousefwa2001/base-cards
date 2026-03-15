import 'package:base_cards/features/card_values/domain/entities/card_value_entity.dart';
import 'package:base_cards/features/home/domain/entities/card_category_entity.dart';
import 'package:base_cards/features/region/domain/entities/region_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/purchased_card_result.dart';

abstract class BuyCardRepository {
  Future<Either<Failure, PurchasedCardResult>> buyAnyAvailableCard({
    required CardCategoryEntity category,
    required RegionEntity region,
    required CardValueEntity value,
  });
}
