import 'package:base_cards/core/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/storage/secure_storage_api.dart';
import '../../domain/repositories/adjust_balance_repository.dart';
import '../datasources/adjust_balance_remote_datasource.dart';

class AdjustBalanceRepositoryImpl implements AdjustBalanceRepository {
  final AdjustBalanceRemoteDataSource remote;
  final SecureStorageApi storage;

  AdjustBalanceRepositoryImpl({required this.remote, required this.storage});

  @override
  Future<Either<Failure, String>> adjustShopBalance({
    required String shopId,
    required int amount,
    required String direction,
    String? note,
  }) async {
    try {
      final supplierId = await storage.getUid();
      if (supplierId == null || supplierId.isEmpty) {
        return const Left(Failure('userNull'));
      }

      final txId = await remote.adjustShopBalance(
        supplierId: supplierId,
        shopId: shopId,
        amount: amount,
        direction: direction,
        note: note,
      );
      AppLogger.info(txId);
      return Right(txId);
    } on FirebaseException catch (e) {
      return Left(Failure(e.code));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
