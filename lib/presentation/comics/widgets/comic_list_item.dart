import 'package:flutter/material.dart';
import 'package:marvel/domain/models/comic_model.dart';
import 'package:marvel/presentation/comics/screens/comic_detail_screen.dart';

class ComicListItem extends StatelessWidget {
  final Comic comic;

  ComicListItem({required this.comic});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(comic.thumbnailUrl),
      title: Text(comic.title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComicDetailScreen(comicId: comic.id),
          ),
        );
      },
    );
  }
}
