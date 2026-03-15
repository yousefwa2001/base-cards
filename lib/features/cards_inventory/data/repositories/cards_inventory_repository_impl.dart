import 'package:base_cards/core/utils/logger.dart';
import 'package:base_cards/features/cards/domain/entities/card_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';

import '../../../cards/data/models/card_model.dart';
import '../../domain/repositories/cards_inventory_repository.dart';
import '../datasources/cards_inventory_remote_data_source.dart';

class CardsInventoryRepositoryImpl implements CardsInventoryRepository {
  final CardsInventoryRemoteDataSource remoteDataSource;
  const CardsInventoryRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<CardEntity>>> getCardsInventory({
    String? categoryId,
    String? regionId,
    String? valueId,
    InventoryStatus status = InventoryStatus.all,
  }) async {
    try {
      final List<CardModel> models = await remoteDataSource.getCardsInventory(
        categoryId: categoryId,
        regionId: regionId,
        valueId: valueId,
        status: status,
      );

      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on FirebaseException catch (e) {
      AppLogger.error(e.message);
      return Left(Failure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
