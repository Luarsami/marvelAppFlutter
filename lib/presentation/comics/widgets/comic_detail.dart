import 'package:marvel/data/repositories/comic_repository.dart';
import 'package:marvel/domain/models/comic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/comics/blocs/comic_bloc.dart';

class ComicDetail extends StatelessWidget {
  final int comicId;

  const ComicDetail({super.key, required this.comicId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ComicBloc(ComicRepository())..getComicDetails(comicId),
      child: BlocBuilder<ComicBloc, List<Comic>>(
        builder: (context, comics) {
          if (comics.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          final comic = comics.firstWhere((char) => char.id == comicId);

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          comic.thumbnailUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                            .toDouble()
                                    : null,
                              );
                            }
                          },
                          height: 350,
                        )),
                    const SizedBox(height: 16),
                    Text(
                      comic.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      comic.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
