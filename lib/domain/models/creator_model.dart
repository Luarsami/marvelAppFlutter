import 'package:marvel/data/models/creator_model.dart';

class Creator {
  final int id;
  final String fullName;
  final String suffix;
  final String thumbnailUrl;

  Creator(
      {required this.id,
      required this.fullName,
      required this.suffix,
      required this.thumbnailUrl});

  factory Creator.fromCreatorModel(CreatorModel model) {
    return Creator(
        id: model.id,
        fullName: model.fullName,
        suffix: model.suffix,
        thumbnailUrl: model.thumbnailUrl);
  }
}
