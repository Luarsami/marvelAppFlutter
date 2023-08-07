import 'package:marvel/data/repositories/serie_repository.dart';
import 'package:marvel/domain/models/serie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/series/blocs/serie_bloc.dart';

class SerieDetail extends StatelessWidget {
  final int serieId;

  const SerieDetail({super.key, required this.serieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SerieBloc(SerieRepository())..getSerieDetails(serieId),
      child: BlocBuilder<SerieBloc, List<Serie>>(
        builder: (context, series) {
          if (series.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          final serie = series.firstWhere((char) => char.id == serieId);

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          serie.thumbnailUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                            .toDouble()
                                    : null,
                              );
                            }
                          },
                          height: 350,
                        )),
                    const SizedBox(height: 16),
                    Text(
                      serie.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      serie.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
