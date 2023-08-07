import 'package:marvel/data/repositories/comic_repository.dart';
import 'package:marvel/domain/models/comic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/comics/blocs/comic_bloc.dart';

class ComicDetail extends StatelessWidget {
  final int comicId;

  ComicDetail({required this.comicId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ComicBloc(ComicRepository())..getComicDetails(comicId),
      child: BlocBuilder<ComicBloc, List<Comic>>(
        builder: (context, comics) {
          if (comics.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          final comic = comics.firstWhere((char) => char.id == comicId);

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Image.network(comic.thumbnailUrl),
                SizedBox(height: 16),
                Text(
                  comic.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(comic.description)
              ],
            ),
          );
        },
      ),
    );
  }
}
