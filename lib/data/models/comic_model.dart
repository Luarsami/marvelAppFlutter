class ComicModel {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;

  ComicModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl});

  factory ComicModel.fromJson(Map<String, dynamic> json) {
    return ComicModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnailUrl:
          "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
    );
  }
}
