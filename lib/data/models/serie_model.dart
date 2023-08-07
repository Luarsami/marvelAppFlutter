class SerieModel {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;

  SerieModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl});

  factory SerieModel.fromJson(Map<String, dynamic> json) {
    return SerieModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnailUrl:
          "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
    );
  }
}
