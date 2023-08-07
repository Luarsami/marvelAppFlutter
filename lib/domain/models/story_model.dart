import 'package:marvel/data/models/story_model.dart';

class Story {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;

  Story(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl});

  factory Story.fromStoryModel(StoryModel model) {
    return Story(
        id: model.id,
        title: model.title,
        description: model.description,
        thumbnailUrl: model.thumbnailUrl);
  }
}
