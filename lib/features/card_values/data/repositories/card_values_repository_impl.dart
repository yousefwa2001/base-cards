import 'package:base_cards/core/utils/logger.dart';
import 'package:base_cards/features/card_values/domain/repositories/card_values_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/card_value_entity.dart';
import '../datasources/card_values_remote_data_source.dart';
import '../models/card_value_model.dart';

class CardValuesRepositoryImpl implements CardValuesRepository {
  final CardValuesRemoteDataSource remoteDataSource;
  const CardValuesRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<CardValueEntity>>> getValuesForCategory({
    required String categoryId,
    required String regionId,
    required bool isSupplier,
  }) async {
    try {
      final List<CardValueModel> models = await remoteDataSource
          .getValuesForCategory(
            categoryId: categoryId,
            regionId: regionId,
            isSupplier: isSupplier,
          );
      final List<CardValueEntity> entities = models.cast<CardValueEntity>();

      return Right(entities);
    } on FirebaseException catch (e) {
      AppLogger.error(e);
      return Left(Failure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePurchasePrice({
    required String categoryId,
    required String regionId,
    required String valueId,
    required int purchasePrice,
  }) async {
    try {
      await remoteDataSource.updatePurchasePrice(
        categoryId: categoryId,
        regionId: regionId,
        valueId: valueId,
        purchasePrice: purchasePrice,
      );
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
