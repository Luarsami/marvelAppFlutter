import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/creators/blocs/creator_bloc.dart';
import 'package:marvel/data/repositories/creator_repository.dart';
import 'package:marvel/presentation/creators/widgets/creator_detail.dart';

class CreatorDetailScreen extends StatelessWidget {
  final int creatorId;

  const CreatorDetailScreen({super.key, required this.creatorId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatorBloc(CreatorRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Creator Details')),
        body: CreatorDetail(creatorId: creatorId),
      ),
    );
  }
}
