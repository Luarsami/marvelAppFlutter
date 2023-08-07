import 'package:flutter/material.dart';
import 'package:marvel/domain/models/character_model.dart';
import 'package:marvel/presentation/characters/screens/character_detail_screen.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;

  const CharacterListItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            character.thumbnailUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!.toDouble()
                      : null,
                );
              }
            },
            width: 60,
          ),
        ),
        title: Text(
          character.name,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontStyle: FontStyle.normal),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CharacterDetailScreen(characterId: character.id),
            ),
          );
        },
      ),
    );
  }
}
