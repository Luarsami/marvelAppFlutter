import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/stories/blocs/story_bloc.dart';
import 'package:marvel/data/repositories/story_repository.dart';
import 'package:marvel/presentation/stories/widgets/story_detail.dart';

class StoryDetailScreen extends StatelessWidget {
  final int storyId;

  StoryDetailScreen({required this.storyId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoryBloc(StoryRepository()),
      child: Scaffold(
        appBar: AppBar(title: Text('Story Details')),
        body: StoryDetail(storyId: storyId),
      ),
    );
  }
}
