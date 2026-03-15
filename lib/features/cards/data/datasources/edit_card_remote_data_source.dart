abstract class EditCardRemoteDataSource {
  Future<void> editCardCode({
    required String cardId,
    required String newCode,
    required String serialNumber,
    required int? expiryYear,
    required int? expiryMonth,
  });
}
