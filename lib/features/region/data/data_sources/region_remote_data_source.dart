import '../models/region_model.dart';

abstract class RegionRemoteDataSource {
  Future<List<RegionModel>> getRegions({
    required String categoryId,
    required bool isSupplier,
  });
}
