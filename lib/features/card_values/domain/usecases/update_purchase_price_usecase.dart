import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/card_values_repository.dart';

class UpdatePurchasePriceUseCase {
  final CardValuesRepository repository;
  const UpdatePurchasePriceUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({
    required String categoryId,
    required String regionId,
    required String valueId,
    required int purchasePrice,
  }) {
    return repository.updatePurchasePrice(
      categoryId: categoryId,
      regionId: regionId,
      valueId: valueId,
      purchasePrice: purchasePrice,
    );
  }
}
