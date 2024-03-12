import 'package:equatable/equatable.dart';

class CatEntity extends Equatable {
  final String id;
  final String name;
  final String origin;
  final int affectionLevel;
  final int intelligence;
  final int adaptability;
  final String imageUrl;
  final String description;
  final String lifeSpan;

  const CatEntity({
    required this.id,
    required this.name,
    required this.origin,
    required this.affectionLevel,
    required this.intelligence,
    required this.adaptability,
    required this.imageUrl,
    required this.description,
    required this.lifeSpan,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    origin,
    affectionLevel,
    intelligence,
    imageUrl,
    description,
    adaptability,
    lifeSpan,
  ];
}
