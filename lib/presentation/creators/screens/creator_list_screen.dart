import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/creator_model.dart';
import 'package:marvel/data/repositories/creator_repository.dart';
import 'package:marvel/presentation/creators/blocs/creator_bloc.dart';
import 'package:marvel/presentation/creators/widgets/creator_list_item.dart';

class CreatorListScreen extends StatelessWidget {
  const CreatorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatorBloc(CreatorRepository())..getCreators(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Marvel Creators')),
        body: const CreatorList(),
      ),
    );
  }
}

class CreatorList extends StatelessWidget {
  const CreatorList({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return BlocBuilder<CreatorBloc, List<Creator>>(
      builder: (context, creators) {
        if (creators.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final creatorBloc = BlocProvider.of<CreatorBloc>(context);

        scrollController.addListener(() {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            creatorBloc.loadMoreCreators();
          }
        });

        return ListView.builder(
          controller: scrollController,
          itemCount: creators.length + 1,
          itemBuilder: (context, index) {
            if (index < creators.length) {
              final creator = creators[index];
              return CreatorListItem(creator: creator);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
