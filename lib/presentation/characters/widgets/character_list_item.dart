import 'package:flutter/material.dart';
import 'package:marvel/domain/models/character_model.dart';
import 'package:marvel/presentation/characters/screens/character_detail_screen.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;

  CharacterListItem({required this.character});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(character.thumbnailUrl),
      title: Text(character.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CharacterDetailScreen(characterId: character.id),
          ),
        );
      },
    );
  }
}
