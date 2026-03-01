import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/purchase_entity.dart';
import '../../domain/repositories/purchase_repository.dart';

import '../datasources/purchase_remote_data_source.dart';
import '../models/purchase_model.dart';

class PurchaseRepositoryImpl implements PurchaseRepository {
  final PurchaseRemoteDataSource remoteDataSource;
  const PurchaseRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<PurchaseEntity>>> getPurchases({
    required String buyerId,
  }) async {
    try {
      final List<PurchaseModel> models = await remoteDataSource.getPurchases(
        buyerId: buyerId,
      );
      final entities = models.cast<PurchaseEntity>();

      return Right(entities);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
