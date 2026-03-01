class PurchasedCardResult {
  final String cardId;
  final String code;
  final int? expiryMonth;
  final int? expiryYear;
  final String serialNumber;

  const PurchasedCardResult({
    required this.cardId,
    required this.code,
    required this.expiryMonth,
    required this.expiryYear,
    required this.serialNumber,
  });
}
