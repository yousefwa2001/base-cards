import 'package:base_cards/features/home/data/datasources/categories_remote_data_source.dart';
import 'package:base_cards/features/home/domain/entities/card_category_entity.dart';
import 'package:base_cards/features/home/domain/repositories/card_categories_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

class CardCategoriesRepositoryImpl implements CardCategoriesRepository {
  final CardCategoriesRemoteDataSource remoteDataSource;

  CardCategoriesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CardCategoryEntity>>> getAllCategories({
    required bool isSupplier,
  }) async {
    try {
      final models = await remoteDataSource.getAllCategories(
        isSupplier: isSupplier,
      );

      final List<CardCategoryEntity> entities =
          models.cast<CardCategoryEntity>();

      return Right(entities);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
