import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../card_values/domain/entities/card_value_entity.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/domain/entities/region_entity.dart';
import '../repositories/add_card_repository.dart';

class AddCardUseCase {
  final AddCardRepository repository;

  AddCardUseCase({required this.repository});

  Future<Either<Failure, void>> call({
    required String cardCode,
    required String serialNumber,
    required int? expiryMonth,
    required int? expiryYear,
    required CardCategoryEntity category,
    required RegionEntity region,
    required CardValueEntity value,
    required String uid,
  }) {
    return repository.addCard(
      cardCode: cardCode,
      category: category,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
      serialNumber: serialNumber,
      region: region,
      value: value,
      uid: uid,
    );
  }
}
