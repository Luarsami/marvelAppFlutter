import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/blocs/character_bloc.dart';
import 'package:marvel/data/repositories/character_repository.dart';
import 'package:marvel/presentation/widgets/character_detail.dart';

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
