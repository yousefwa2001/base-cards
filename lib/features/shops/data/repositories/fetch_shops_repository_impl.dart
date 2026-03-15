import 'package:base_cards/features/auth/data/models/user_model.dart';
import 'package:base_cards/features/auth/domain/entities/user_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/fetch_shops_repository.dart';
import '../datasources/fetch_shops_remote_datasource.dart';

class FetchShopsRepositoryImpl implements FetchShopsRepository {
  final FetchShopsRemoteDatasource remoteDataSource;
  const FetchShopsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<UserEntity>>> getShops() async {
    try {
      final List<UserModel> models = await remoteDataSource.getShops();
      final entities = models.cast<UserEntity>();

      return Right(entities);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
