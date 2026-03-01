import 'package:base_cards/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class FetchShopsRepository {
  Future<Either<Failure, List<UserEntity>>> getShops();
}
