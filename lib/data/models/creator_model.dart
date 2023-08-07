class CreatorModel {
  final int id;
  final String fullName;
  final String suffix;
  final String thumbnailUrl;

  CreatorModel(
      {required this.id,
      required this.fullName,
      required this.suffix,
      required this.thumbnailUrl});

  factory CreatorModel.fromJson(Map<String, dynamic> json) {
    return CreatorModel(
      id: json['id'],
      fullName: json['fullName'],
      suffix: json['suffix'],
      thumbnailUrl:
          "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
    );
  }
}
