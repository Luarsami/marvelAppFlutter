import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/data/repositories/story_repository.dart';
import 'package:marvel/domain/models/story_model.dart';

class StoryBloc extends Cubit<List<Story>> {
  final StoryRepository repository;

  StoryBloc(this.repository) : super([]);

  void getStories() async {
    try {
      final stories = await repository.fetchStories();
      final storyList =
          stories.map((model) => Story.fromStoryModel(model)).toList();
      emit(storyList);
    } catch (e) {
      emit([]);
    }
  }

  void getStoryDetails(int storyId) async {
    try {
      final story = await repository.fetchStoryDetails(storyId);
      final storyDetail = Story.fromStoryModel(story);
      emit([storyDetail]);
    } catch (e) {
      emit([]);
    }
  }
}
