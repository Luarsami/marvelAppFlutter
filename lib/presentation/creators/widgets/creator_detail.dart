import 'package:marvel/data/repositories/creator_repository.dart';
import 'package:marvel/domain/models/creator_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/creators/blocs/creator_bloc.dart';

class CreatorDetail extends StatelessWidget {
  final int creatorId;

  const CreatorDetail({super.key, required this.creatorId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreatorBloc(CreatorRepository())..getCreatorDetails(creatorId),
      child: BlocBuilder<CreatorBloc, List<Creator>>(
        builder: (context, creators) {
          if (creators.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          final creator = creators.firstWhere((char) => char.id == creatorId);

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
                          creator.thumbnailUrl,
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
                      creator.fullName,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      creator.suffix,
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
