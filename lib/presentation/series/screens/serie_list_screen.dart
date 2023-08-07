import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/serie_model.dart';
import 'package:marvel/data/repositories/serie_repository.dart';
import 'package:marvel/presentation/series/blocs/serie_bloc.dart';
import 'package:marvel/presentation/series/widgets/serie_list_item.dart';

class SerieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SerieBloc(SerieRepository())..getSeries(),
      child: Scaffold(
        appBar: AppBar(title: Text('Marvel Series')),
        body: SerieList(),
      ),
    );
  }
}

class SerieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SerieBloc, List<Serie>>(
      builder: (context, series) {
        if (series.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: series.length,
          itemBuilder: (context, index) {
            final serie = series[index];
            return SerieListItem(serie: serie);
          },
        );
      },
    );
  }
}
