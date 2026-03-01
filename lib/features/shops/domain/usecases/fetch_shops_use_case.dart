import 'package:base_cards/features/auth/domain/entities/user_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/fetch_shops_repository.dart';

class FetchShopsUseCase {
  final FetchShopsRepository repository;

  FetchShopsUseCase({required this.repository});

  Future<Either<Failure, List<UserEntity>>> call() {
    return repository.getShops();
  }
}
