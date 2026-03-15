import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';


import '../../../adjust_balance/domain/entities/balance_entity.dart';
import '../repositories/transactions_repository.dart';

class TransactionsUseCase {
  final TransactionsRepository repository;

  TransactionsUseCase({required this.repository});

  Future<Either<Failure, List<BalanceEntity>>> call({
    required String shopId,
  }) {
    return repository.getTransactionss(shopId: shopId);
  }
}
