import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/data/repositories/character_repository.dart';
import 'package:marvel/domain/models/character_model.dart';

class CharacterBloc extends Cubit<List<Character>> {
  final CharacterRepository repository;

  CharacterBloc(this.repository) : super([]);

  void getCharacters() async {
    try {
      final characters = await repository.fetchCharacters();
      final characterList = characters
          .map((model) => Character.fromCharacterModel(model))
          .toList();
      emit(characterList);
    } catch (e) {
      emit([]);
    }
  }

  void loadMoreCharacters() async {
    try {
      final characters = await repository.fetchMoreCharacters(state.length);
      final characterList = characters
          .map((model) => Character.fromCharacterModel(model))
          .toList();
      emit([...state, ...characterList]);
    } catch (e) {
      emit([]);
    }
  }

  void getCharacterDetails(int characterId) async {
    try {
      final character = await repository.fetchCharacterDetails(characterId);
      final characterDetail = Character.fromCharacterModel(character);
      emit([characterDetail]);
    } catch (e) {
      emit([]);
    }
  }
}
