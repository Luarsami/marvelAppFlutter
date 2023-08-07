import 'package:marvel/data/models/serie_model.dart';

class Serie {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;

  Serie(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl});

  factory Serie.fromSerieModel(SerieModel model) {
    return Serie(
        id: model.id,
        title: model.title,
        description: model.description,
        thumbnailUrl: model.thumbnailUrl);
  }
}
