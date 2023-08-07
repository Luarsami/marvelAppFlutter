import 'package:marvel/data/repositories/serie_repository.dart';
import 'package:marvel/domain/models/serie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/series/blocs/serie_bloc.dart';

class SerieDetail extends StatelessWidget {
  final int serieId;

  SerieDetail({required this.serieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SerieBloc(SerieRepository())..getSerieDetails(serieId),
      child: BlocBuilder<SerieBloc, List<Serie>>(
        builder: (context, series) {
          if (series.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          final serie = series.firstWhere((char) => char.id == serieId);

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Image.network(serie.thumbnailUrl),
                SizedBox(height: 16),
                Text(
                  serie.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(serie.description)
              ],
            ),
          );
        },
      ),
    );
  }
}
