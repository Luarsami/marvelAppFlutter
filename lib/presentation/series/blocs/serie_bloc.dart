import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/data/repositories/serie_repository.dart';
import 'package:marvel/domain/models/serie_model.dart';

class SerieBloc extends Cubit<List<Serie>> {
  final SerieRepository repository;

  SerieBloc(this.repository) : super([]);

  void getSeries() async {
    try {
      final series = await repository.fetchSeries();
      final serieList =
          series.map((model) => Serie.fromSerieModel(model)).toList();
      emit(serieList);
    } catch (e) {
      emit([]);
    }
  }

  void loadMoreSeries() async {
    try {
      final series = await repository.fetchMoreSeries(state.length);
      final serieList =
          series.map((model) => Serie.fromSerieModel(model)).toList();
      emit([...state, ...serieList]);
    } catch (e) {
      emit([]);
    }
  }

  void getSerieDetails(int serieId) async {
    try {
      final serie = await repository.fetchSerieDetails(serieId);
      final serieDetail = Serie.fromSerieModel(serie);
      emit([serieDetail]);
    } catch (e) {
      emit([]);
    }
  }
}
