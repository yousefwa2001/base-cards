
import '../../domain/repositories/balance_repository.dart';
import '../datasources/balance_remote_data_source.dart';

class BalanceRepositoryImpl implements BalanceRepository {
  final BalanceRemoteDataSource remoteDataSource;

  BalanceRepositoryImpl(this.remoteDataSource);

  @override
  Stream<int> watchUserBalance(String userId) {
    return remoteDataSource.watchUserBalance(userId);
  }
}
