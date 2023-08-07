import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/story_model.dart';
import 'package:marvel/data/repositories/story_repository.dart';
import 'package:marvel/presentation/stories/blocs/story_bloc.dart';
import 'package:marvel/presentation/stories/widgets/story_list_item.dart';

class StoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoryBloc(StoryRepository())..getStories(),
      child: Scaffold(
        appBar: AppBar(title: Text('Marvel Stories')),
        body: StoryList(),
      ),
    );
  }
}

class StoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryBloc, List<Story>>(
      builder: (context, stories) {
        if (stories.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return StoryListItem(story: story);
          },
        );
      },
    );
  }
}
