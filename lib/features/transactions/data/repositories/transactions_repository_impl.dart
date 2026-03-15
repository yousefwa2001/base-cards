import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../adjust_balance/data/models/balance_model.dart';
import '../../../adjust_balance/domain/entities/balance_entity.dart';

import '../../domain/repositories/transactions_repository.dart';
import '../datasources/transactions_remote_data_source.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsRemoteDataSource remoteDataSource;
  const TransactionsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<BalanceEntity>>> getTransactionss({
    required String shopId,
  }) async {
    try {
      final List<BalanceModel> models = await remoteDataSource.getTransactions(
        shopId: shopId,
      );
      final entities = models.cast<BalanceEntity>();

      return Right(entities);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
