import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/blocs/character_bloc.dart';

class CharacterDetailScreen extends StatelessWidget {
  final int characterId;

  CharacterDetailScreen({required this.characterId});

  @override
  Widget build(BuildContext context) {
    context.read<CharacterBloc>().getCharacterDetails(characterId);
    return Scaffold(
      appBar: AppBar(title: Text('Character Details')),
      body: CharacterDetail(),
    );
  }
}

class CharacterDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final character = context.watch<CharacterBloc>().state.first;

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
  }
}
