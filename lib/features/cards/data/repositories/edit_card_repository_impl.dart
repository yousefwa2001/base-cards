import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/edit_card_repository.dart';
import '../datasources/edit_card_remote_data_source.dart';

class EditCardRepositoryImpl implements EditCardRepository {
  final EditCardRemoteDataSource remoteDataSource;

  EditCardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Unit>> editCardCode({
    required String cardId,
    required String newCode,
    required String serialNumber,
    required int? expiryYear,
    required int? expiryMonth,
  }) async {
    try {
      await remoteDataSource.editCardCode(
        cardId: cardId,
        newCode: newCode,
        serialNumber: serialNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
      );
      return const Right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'invalid-code') {
        return const Left(Failure('invalid-code'));
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
