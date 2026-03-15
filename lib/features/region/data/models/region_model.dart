import '../../domain/entities/region_entity.dart';

class RegionModel extends RegionEntity {
  const RegionModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.isActive,
  });

  factory RegionModel.fromFirestore(String id, Map<String, dynamic> data) {
    return RegionModel(
      id: id,
      name: data['name'],
      imageUrl: data['imageUrl'],
      isActive: data['isActive'],
    );
  }
}
