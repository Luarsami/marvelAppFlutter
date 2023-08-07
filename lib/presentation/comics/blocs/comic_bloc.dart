import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/data/repositories/comic_repository.dart';
import 'package:marvel/domain/models/comic_model.dart';

class ComicBloc extends Cubit<List<Comic>> {
  final ComicRepository repository;

  ComicBloc(this.repository) : super([]);

  void getComics() async {
    try {
      final comics = await repository.fetchComics();
      final comicList =
          comics.map((model) => Comic.fromComicModel(model)).toList();
      emit(comicList);
    } catch (e) {
      emit([]);
    }
  }

  void loadMoreComics() async {
    try {
      final comics = await repository.fetchMoreComics(state.length);
      final comicList =
          comics.map((model) => Comic.fromComicModel(model)).toList();
      emit([...state, ...comicList]);
    } catch (e) {
      emit([]);
    }
  }

  void getComicDetails(int comicId) async {
    try {
      final comic = await repository.fetchComicDetails(comicId);
      final comicDetail = Comic.fromComicModel(comic);
      emit([comicDetail]);
    } catch (e) {
      emit([]);
    }
  }
}
