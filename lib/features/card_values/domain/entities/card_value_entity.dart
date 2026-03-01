class CardValueEntity {
  final String id;
  final int value;
  final int price;
  final int purchasePrice;
  final bool isActive;


  const CardValueEntity({
    required this.id,
    required this.value,
    required this.price,
    required this.purchasePrice, required this.isActive,
  });
}
