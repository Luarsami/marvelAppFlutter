import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/story_model.dart';
import 'package:marvel/data/repositories/story_repository.dart';
import 'package:marvel/presentation/stories/blocs/story_bloc.dart';
import 'package:marvel/presentation/stories/widgets/story_list_item.dart';

class StoryListScreen extends StatelessWidget {
  const StoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoryBloc(StoryRepository())..getStories(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Marvel Stories')),
        body: const StoryList(),
      ),
    );
  }
}

class StoryList extends StatelessWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return BlocBuilder<StoryBloc, List<Story>>(
      builder: (context, stories) {
        if (stories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final storieBloc = BlocProvider.of<StoryBloc>(context);

        scrollController.addListener(() {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            storieBloc.loadMoreStories();
          }
        });

        return ListView.builder(
          controller: scrollController,
          itemCount: stories.length + 1,
          itemBuilder: (context, index) {
            if (index < stories.length) {
              final story = stories[index];
              return StoryListItem(story: story);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
