import 'package:marvel/data/repositories/story_repository.dart';
import 'package:marvel/domain/models/story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/stories/blocs/story_bloc.dart';

class StoryDetail extends StatelessWidget {
  final int storyId;

  StoryDetail({required this.storyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StoryBloc(StoryRepository())..getStoryDetails(storyId),
      child: BlocBuilder<StoryBloc, List<Story>>(
        builder: (context, stories) {
          if (stories.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          final story = stories.firstWhere((char) => char.id == storyId);

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Image.network(story.thumbnailUrl),
                SizedBox(height: 16),
                Text(
                  story.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(story.description)
              ],
            ),
          );
        },
      ),
    );
  }
}
