import 'package:marvel/data/repositories/character_repository.dart';
import 'package:marvel/domain/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/characters/blocs/character_bloc.dart';

class CharacterDetail extends StatelessWidget {
  final int characterId;

  const CharacterDetail({super.key, required this.characterId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterBloc(CharacterRepository())
        ..getCharacterDetails(characterId),
      child: BlocBuilder<CharacterBloc, List<Character>>(
        builder: (context, characters) {
          if (characters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          final character =
              characters.firstWhere((char) => char.id == characterId);

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          character.thumbnailUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                            .toDouble()
                                    : null,
                              );
                            }
                          },
                          height: 350,
                        )),
                    const SizedBox(height: 16),
                    Text(
                      character.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      character.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
