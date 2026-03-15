import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import '../entities/region_entity.dart';
import '../repositories/region_repository.dart';

class RegionUseCase {
  final RegionRepository repository;

  RegionUseCase({required this.repository});

  Future<Either<Failure, List<RegionEntity>>> call({
    required String categoryId,
    required bool isSupplier,
  }) {
    return repository.getRegions(
      categoryId: categoryId,
      isSupplier: isSupplier,
    );
  }
}
