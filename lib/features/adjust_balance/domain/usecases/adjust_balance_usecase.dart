import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

import '../repositories/adjust_balance_repository.dart';

class AdjustShopBalanceUseCase {
  final AdjustBalanceRepository repository;

  AdjustShopBalanceUseCase({required this.repository});

  Future<Either<Failure, String>> call({
    required String shopId,
    required int amount,
    required String direction,
    String? note,
  }) async {
    return repository.adjustShopBalance(
      shopId: shopId,
      amount: amount,
      direction: direction,
      note: note,
    );
  }
}
