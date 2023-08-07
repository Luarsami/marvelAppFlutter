import 'package:marvel/data/models/event_model.dart';

class Event {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;

  Event(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl});

  factory Event.fromEventModel(EventModel model) {
    return Event(
        id: model.id,
        title: model.title,
        description: model.description,
        thumbnailUrl: model.thumbnailUrl);
  }
}
