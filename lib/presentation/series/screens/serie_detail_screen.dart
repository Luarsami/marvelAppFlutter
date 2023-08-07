import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/series/blocs/serie_bloc.dart';
import 'package:marvel/data/repositories/serie_repository.dart';
import 'package:marvel/presentation/series/widgets/serie_detail.dart';

class SerieDetailScreen extends StatelessWidget {
  final int serieId;

  SerieDetailScreen({required this.serieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SerieBloc(SerieRepository()),
      child: Scaffold(
        appBar: AppBar(title: Text('Serie Details')),
        body: SerieDetail(serieId: serieId),
      ),
    );
  }
}
