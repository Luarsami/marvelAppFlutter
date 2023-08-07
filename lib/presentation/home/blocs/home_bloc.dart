import 'package:flutter_bloc/flutter_bloc.dart';

enum Category {
  characters,
  comics,
  creators,
  events,
}

class HomeState {
  final Category selectedCategory;

  HomeState(this.selectedCategory);
}

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState(Category.characters));

  void selectCategory(Category category) {
    emit(HomeState(category));
  }
}
