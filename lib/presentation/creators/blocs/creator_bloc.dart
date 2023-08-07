import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/data/repositories/creator_repository.dart';
import 'package:marvel/domain/models/creator_model.dart';

class CreatorBloc extends Cubit<List<Creator>> {
  final CreatorRepository repository;

  CreatorBloc(this.repository) : super([]);

  void getCreators() async {
    try {
      final creators = await repository.fetchCreators();
      final creatorList =
          creators.map((model) => Creator.fromCreatorModel(model)).toList();
      emit(creatorList);
    } catch (e) {
      emit([]);
    }
  }

  void getCreatorDetails(int creatorId) async {
    try {
      final creator = await repository.fetchCreatorDetails(creatorId);
      final creatorDetail = Creator.fromCreatorModel(creator);
      emit([creatorDetail]);
    } catch (e) {
      emit([]);
    }
  }
}
