import 'package:flutter/material.dart';
import 'package:marvel/domain/models/serie_model.dart';
import 'package:marvel/presentation/series/screens/serie_detail_screen.dart';

class SerieListItem extends StatelessWidget {
  final Serie serie;

  const SerieListItem({super.key, required this.serie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              serie.thumbnailUrl,
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
        title: Text(serie.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontStyle: FontStyle.normal)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SerieDetailScreen(serieId: serie.id),
            ),
          );
        },
      ),
    );
  }
}
