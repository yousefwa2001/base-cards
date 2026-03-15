class CardCategoryEntity {
  final String id;
  final String name;
  final String imageUrl;
  final String color;
  final bool isActive;

  const CardCategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.color,
    required this.isActive,
  });
}
