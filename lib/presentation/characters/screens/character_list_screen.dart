import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/character_model.dart';
import 'package:marvel/data/repositories/character_repository.dart';
import 'package:marvel/presentation/characters/blocs/character_bloc.dart';
import 'package:marvel/presentation/characters/widgets/character_list_item.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharacterBloc(CharacterRepository())..getCharacters(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Marvel Characters')),
        body: const CharacterList(),
      ),
    );
  }
}

class CharacterList extends StatelessWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return BlocBuilder<CharacterBloc, List<Character>>(
      builder: (context, characters) {
        if (characters.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final characterBloc = BlocProvider.of<CharacterBloc>(context);

        scrollController.addListener(() {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            characterBloc.loadMoreCharacters();
          }
        });

        return ListView.builder(
          controller: scrollController,
          itemCount: characters.length + 1,
          itemBuilder: (context, index) {
            if (index < characters.length) {
              final character = characters[index];
              return CharacterListItem(character: character);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
