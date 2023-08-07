import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/serie_model.dart';
import 'package:marvel/data/repositories/serie_repository.dart';
import 'package:marvel/presentation/series/blocs/serie_bloc.dart';
import 'package:marvel/presentation/series/widgets/serie_list_item.dart';

class SerieListScreen extends StatelessWidget {
  const SerieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SerieBloc(SerieRepository())..getSeries(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Marvel Series')),
        body: const SerieList(),
      ),
    );
  }
}

class SerieList extends StatelessWidget {
  const SerieList({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return BlocBuilder<SerieBloc, List<Serie>>(
      builder: (context, series) {
        if (series.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final serieBloc = BlocProvider.of<SerieBloc>(context);

        scrollController.addListener(() {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            serieBloc.loadMoreSeries();
          }
        });

        return ListView.builder(
          controller: scrollController,
          itemCount: series.length + 1,
          itemBuilder: (context, index) {
            if (index < series.length) {
              final serie = series[index];
              return SerieListItem(serie: serie);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
