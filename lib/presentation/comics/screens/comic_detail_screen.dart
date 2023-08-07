import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/comics/blocs/comic_bloc.dart';
import 'package:marvel/data/repositories/comic_repository.dart';
import 'package:marvel/presentation/comics/widgets/comic_detail.dart';

class ComicDetailScreen extends StatelessWidget {
  final int comicId;

  const ComicDetailScreen({super.key, required this.comicId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComicBloc(ComicRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Comic Details')),
        body: ComicDetail(comicId: comicId),
      ),
    );
  }
}
