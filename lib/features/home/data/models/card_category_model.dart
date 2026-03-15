import '../../domain/entities/card_category_entity.dart';

class CardCategoryModel extends CardCategoryEntity {
  const CardCategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.color,
    required super.isActive,
  });

  factory CardCategoryModel.fromFirestore({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return CardCategoryModel(
      id: id,
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      color: data['color'] ?? '',
      isActive: data['isActive'] ?? true,
    );
  }
}
