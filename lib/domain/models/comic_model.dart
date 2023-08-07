import 'package:marvel/data/models/comic_model.dart';

class Comic {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;

  Comic(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl});

  factory Comic.fromComicModel(ComicModel model) {
    return Comic(
        id: model.id,
        title: model.title,
        description: model.description,
        thumbnailUrl: model.thumbnailUrl);
  }
}
