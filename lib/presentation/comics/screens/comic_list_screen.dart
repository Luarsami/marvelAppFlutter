import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/comic_model.dart';
import 'package:marvel/data/repositories/comic_repository.dart';
import 'package:marvel/presentation/comics/blocs/comic_bloc.dart';
import 'package:marvel/presentation/comics/widgets/comic_list_item.dart';

class ComicListScreen extends StatelessWidget {
  const ComicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComicBloc(ComicRepository())..getComics(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Marvel Comics')),
        body: const ComicList(),
      ),
    );
  }
}

class ComicList extends StatelessWidget {
  const ComicList({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return BlocBuilder<ComicBloc, List<Comic>>(
      builder: (context, comics) {
        if (comics.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final comicBloc = BlocProvider.of<ComicBloc>(context);

        scrollController.addListener(() {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            comicBloc.loadMoreComics();
          }
        });

        return ListView.builder(
          controller: scrollController,
          itemCount: comics.length + 1,
          itemBuilder: (context, index) {
            if (index < comics.length) {
              final comic = comics[index];
              return ComicListItem(comic: comic);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
