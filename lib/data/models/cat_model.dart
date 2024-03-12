import 'package:cats_app/domain/entities/cat_entity.dart';

class CatModel extends CatEntity {

  const CatModel({
    required super.name,
    required super.origin,
    required super.affectionLevel,
    required super.intelligence,
    required super.imageUrl,
    required super.id,
    required super.adaptability,
    required super.description,
    required super.lifeSpan,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic>? imageData = json['image'] ;
    return CatModel(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      affectionLevel: json['affection_level'],
      intelligence: json['intelligence'],
      imageUrl: imageData?['url'] ?? '',
      adaptability: json['adaptability'],
      description: json['description'],
      lifeSpan: json['life_span'],
    );
  }

}