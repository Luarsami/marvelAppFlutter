import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/creator_model.dart';
import 'package:marvel/data/repositories/creator_repository.dart';
import 'package:marvel/presentation/creators/blocs/creator_bloc.dart';
import 'package:marvel/presentation/creators/widgets/creator_list_item.dart';

class CreatorListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatorBloc(CreatorRepository())..getCreators(),
      child: Scaffold(
        appBar: AppBar(title: Text('Marvel Creators')),
        body: CreatorList(),
      ),
    );
  }
}

class CreatorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatorBloc, List<Creator>>(
      builder: (context, creators) {
        if (creators.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: creators.length,
          itemBuilder: (context, index) {
            final creator = creators[index];
            return CreatorListItem(creator: creator);
          },
        );
      },
    );
  }
}
