import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/character_model.dart';
import 'package:marvel/data/repositories/character_repository.dart';
import 'package:marvel/presentation/blocs/character_bloc.dart';
import 'package:marvel/presentation/widgets/character_list_item.dart';

class CharacterListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharacterBloc(CharacterRepository())..getCharacters(),
      child: Scaffold(
        appBar: AppBar(title: Text('Marvel Characters')),
        body: CharacterList(),
      ),
    );
  }
}

class CharacterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, List<Character>>(
      builder: (context, characters) {
        if (characters.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final character = characters[index];
            return CharacterListItem(character: character);
          },
        );
      },
    );
  }
}
