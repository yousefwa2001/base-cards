import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/region_entity.dart';
import '../../domain/repositories/region_repository.dart';
import '../data_sources/region_remote_data_source.dart';
import '../models/region_model.dart';

class RegionRepositoryImpl implements RegionRepository {
  final RegionRemoteDataSource remoteDataSource;
  const RegionRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<RegionEntity>>> getRegions({
    required String categoryId,
    required bool isSupplier,
  }) async {
    try {
      final List<RegionModel> models = await remoteDataSource.getRegions(
        categoryId: categoryId,
        isSupplier: isSupplier,
      );
      final entities = models.cast<RegionEntity>();

      return Right(entities);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
