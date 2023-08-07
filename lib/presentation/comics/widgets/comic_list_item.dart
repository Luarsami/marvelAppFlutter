import 'package:flutter/material.dart';
import 'package:marvel/domain/models/comic_model.dart';
import 'package:marvel/presentation/comics/screens/comic_detail_screen.dart';

class ComicListItem extends StatelessWidget {
  final Comic comic;

  const ComicListItem({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              comic.thumbnailUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!.toDouble()
                        : null,
                  );
                }
              },
              width: 60,
            )),
        title: Text(comic.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontStyle: FontStyle.normal)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComicDetailScreen(comicId: comic.id),
            ),
          );
        },
      ),
    );
  }
}
