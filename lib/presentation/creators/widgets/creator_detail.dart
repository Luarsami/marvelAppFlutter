import 'package:marvel/data/repositories/creator_repository.dart';
import 'package:marvel/domain/models/creator_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/creators/blocs/creator_bloc.dart';

class CreatorDetail extends StatelessWidget {
  final int creatorId;

  CreatorDetail({required this.creatorId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreatorBloc(CreatorRepository())..getCreatorDetails(creatorId),
      child: BlocBuilder<CreatorBloc, List<Creator>>(
        builder: (context, creators) {
          if (creators.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          final creator = creators.firstWhere((char) => char.id == creatorId);

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Image.network(creator.thumbnailUrl),
                SizedBox(height: 16),
                Text(
                  creator.fullName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(creator.suffix)
              ],
            ),
          );
        },
      ),
    );
  }
}
