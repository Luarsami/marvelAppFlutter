import 'package:marvel/data/repositories/character_repository.dart';
import 'package:marvel/domain/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/blocs/character_bloc.dart';

class CharacterDetail extends StatelessWidget {
  final int characterId;

  CharacterDetail({required this.characterId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterBloc(CharacterRepository())
        ..getCharacterDetails(characterId),
      child: BlocBuilder<CharacterBloc, List<Character>>(
        builder: (context, characters) {
          if (characters.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          final character =
              characters.firstWhere((char) => char.id == characterId);

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Image.network(character.thumbnailUrl),
                SizedBox(height: 16),
                Text(
                  character.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(character.description)
              ],
            ),
          );
        },
      ),
    );
  }
}
