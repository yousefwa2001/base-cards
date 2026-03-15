import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../adjust_balance/domain/entities/balance_entity.dart';


abstract class TransactionsRepository {
  Future<Either<Failure, List<BalanceEntity>>> getTransactionss({
    required String shopId,
  });
}
