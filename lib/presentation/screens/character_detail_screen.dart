import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/blocs/character_bloc.dart';
import 'package:marvel/data/repositories/character_repository.dart';
import 'package:marvel/domain/models/character_model.dart';

class CharacterDetailScreen extends StatelessWidget {
  final int characterId;

  CharacterDetailScreen({required this.characterId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterBloc(CharacterRepository()),
      child: Scaffold(
        appBar: AppBar(title: Text('Character Details')),
        body: CharacterDetail(characterId: characterId),
      ),
    );
  }
}

class CharacterDetail extends StatelessWidget {
  final int characterId;

  CharacterDetail({required this.characterId});

  @override
  Widget build(BuildContext context) {
    final characterBloc = BlocProvider.of<CharacterBloc>(context);

    return BlocBuilder<CharacterBloc, List<Character>>(
      builder: (context, characters) {
        final character =
            characters.firstWhere((char) => char.id == characterId);

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(character.thumbnailUrl),
              SizedBox(height: 16),
              Text(character.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(character.description),
            ],
          ),
        );
      },
    );
  }
}
