import 'package:base_cards/core/storage/secure_storage_api.dart';
import 'package:base_cards/features/card_values/domain/entities/card_value_entity.dart';
import 'package:base_cards/features/home/domain/entities/card_category_entity.dart';
import 'package:base_cards/features/region/domain/entities/region_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/purchased_card_result.dart';
import '../../domain/repositories/buy_card_repository.dart';
import '../datasources/buy_card_remote_data_source_impl.dart';

class BuyCardRepositoryImpl implements BuyCardRepository {
  final BuyCardRemoteDataSource remoteDataSource;
  final SecureStorageApi storage;

  BuyCardRepositoryImpl({
    required this.remoteDataSource,
    required this.storage,
  });

  @override
  Future<Either<Failure, PurchasedCardResult>> buyAnyAvailableCard({
    required CardCategoryEntity category,
    required RegionEntity region,
    required CardValueEntity value,
  }) async {
    try {
      final buyerUid = await storage.getUid();
      if (buyerUid == null || buyerUid.isEmpty) {
        return const Left(Failure('userNull'));
      }

      final buyerName = await storage.getUserName() ?? '';
      final result = await remoteDataSource.buyAnyAvailableCard(
        buyerUid: buyerUid,
        buyerName: buyerName,
        category: category,
        region: region,
        value: value,
      );

      return Right(result);
    } on FirebaseException catch (e) {
      if (e.code == 'insufficient-balance') {
        return const Left(Failure('insufficient-balance'));
      }
      if (e.code == 'no-cards') {
        return const Left(Failure('no-cards'));
      }
      if (e.code == 'already-sold') {
        return const Left(Failure('already-sold'));
      }
      if (e.code == 'invalid-card') {
        return const Left(Failure('invalid-card'));
      }
      return Left(Failure('unexpected', debugMessage: e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
