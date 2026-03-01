import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/region_entity.dart';

abstract class RegionRepository {
  Future<Either<Failure, List<RegionEntity>>> getRegions({
    required String categoryId,
    required bool isSupplier,
  });
}
