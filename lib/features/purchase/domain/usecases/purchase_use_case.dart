import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import '../entities/purchase_entity.dart';
import '../repositories/purchase_repository.dart';

class PurchaseUseCase {
  final PurchaseRepository repository;

  PurchaseUseCase({required this.repository});

  Future<Either<Failure, List<PurchaseEntity>>> call({
    required String buyerId,
  }) {
    return repository.getPurchases(buyerId: buyerId);
  }
}
