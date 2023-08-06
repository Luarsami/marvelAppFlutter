import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/character_model.dart';
import '../../data/repositories/character_repository.dart';

class CharacterBloc extends Cubit<List<CharacterModel>> {
  final CharacterRepository repository;

  CharacterBloc(this.repository) : super([]);

  void getCharacters() async {
    try {
      final characters = await repository.fetchCharacters();
      emit(characters);
    } catch (e) {
      emit([]);
    }
  }

  void getCharacterDetails(int characterId) async {
    try {
      final character = await repository.fetchCharacterDetails(characterId);
      emit([character]);
    } catch (e) {
      emit([]);
    }
  }
}
