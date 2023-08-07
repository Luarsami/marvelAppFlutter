import 'package:flutter/material.dart';
import 'package:marvel/domain/models/serie_model.dart';
import 'package:marvel/presentation/series/screens/serie_detail_screen.dart';

class SerieListItem extends StatelessWidget {
  final Serie serie;

  SerieListItem({required this.serie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(serie.thumbnailUrl),
      title: Text(serie.title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SerieDetailScreen(serieId: serie.id),
          ),
        );
      },
    );
  }
}
