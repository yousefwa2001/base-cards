import 'package:base_cards/features/card_values/domain/entities/card_value_entity.dart';
import 'package:base_cards/features/home/domain/entities/card_category_entity.dart';
import 'package:base_cards/features/region/domain/entities/region_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/purchased_card_result.dart';
import '../repositories/buy_card_repository.dart';

class BuyCardUseCase {
  final BuyCardRepository repository;

  BuyCardUseCase({required this.repository});

  Future<Either<Failure, PurchasedCardResult>> call({
    required CardCategoryEntity category,
    required RegionEntity region,
    required CardValueEntity value,
  }) {
    return repository.buyAnyAvailableCard(
      category: category,
      region: region,
      value: value,
    );
  }
}
