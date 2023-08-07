class EventModel {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;

  EventModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnailUrl:
          "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
    );
  }
}
