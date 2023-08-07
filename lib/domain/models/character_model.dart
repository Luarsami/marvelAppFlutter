import 'package:marvel/data/models/character_model.dart';

class Character {
  final int id;
  final String name;
  final String description;
  final String thumbnailUrl;

  Character(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnailUrl});

  factory Character.fromCharacterModel(CharacterModel model) {
    return Character(
      id: model.id,
      name: model.name,
      description: model.description,
      thumbnailUrl: model.thumbnailUrl,
    );
  }
}
