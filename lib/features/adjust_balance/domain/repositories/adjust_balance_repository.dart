import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class AdjustBalanceRepository {
  Future<Either<Failure, String>> adjustShopBalance({
    required String shopId,
    required int amount,
    required String direction,
    String? note,
  });
}
