import 'package:flutter/material.dart';
import 'package:marvel/domain/models/character_model.dart';
import 'package:marvel/presentation/screens/character_detail_screen.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;

  CharacterListItem({required this.character});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          Image.network(character.thumbnailUrl), // Mostrar imagen en miniatura
      title: Text(character.name), // Mostrar nombre del personaje
      subtitle:
          Text(character.description), // Mostrar descripción del personaje
      onTap: () {
        // Navegar a la pantalla de detalles del personaje
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
