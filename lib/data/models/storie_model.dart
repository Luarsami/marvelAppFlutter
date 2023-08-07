class StoryModel {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;

  StoryModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl});

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnailUrl:
          "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
    );
  }
}
