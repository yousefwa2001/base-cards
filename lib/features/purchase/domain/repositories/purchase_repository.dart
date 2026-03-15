import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/purchase_entity.dart';

abstract class PurchaseRepository {
  Future<Either<Failure, List<PurchaseEntity>>> getPurchases({
    required String buyerId,
  });
}
