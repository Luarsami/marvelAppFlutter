import 'package:flutter/material.dart';
import 'package:marvel/domain/models/story_model.dart';
import 'package:marvel/presentation/stories/screens/story_detail_screen.dart';

class StoryListItem extends StatelessWidget {
  final Story story;

  StoryListItem({required this.story});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(story.thumbnailUrl),
      title: Text(story.title),
      subtitle: Text(story.description),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryDetailScreen(storyId: story.id),
          ),
        );
      },
    );
  }
}
