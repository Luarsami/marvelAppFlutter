import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/comic_model.dart';
import 'package:marvel/data/repositories/comic_repository.dart';
import 'package:marvel/presentation/comics/blocs/comic_bloc.dart';
import 'package:marvel/presentation/comics/widgets/comic_list_item.dart';

class ComicListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComicBloc(ComicRepository())..getComics(),
      child: Scaffold(
        appBar: AppBar(title: Text('Marvel Comics')),
        body: ComicList(),
      ),
    );
  }
}

class ComicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicBloc, List<Comic>>(
      builder: (context, comics) {
        if (comics.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: comics.length,
          itemBuilder: (context, index) {
            final comic = comics[index];
            return ComicListItem(comic: comic);
          },
        );
      },
    );
  }
}
