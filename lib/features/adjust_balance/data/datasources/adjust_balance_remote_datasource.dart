abstract class AdjustBalanceRemoteDataSource {
  Future<String> adjustShopBalance({
    required String supplierId,
    required String shopId,
    required int amount,
    required String direction,
    String? note,
  });
}
