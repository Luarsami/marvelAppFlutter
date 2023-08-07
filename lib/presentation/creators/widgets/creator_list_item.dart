import 'package:flutter/material.dart';
import 'package:marvel/domain/models/creator_model.dart';
import 'package:marvel/presentation/creators/screens/creator_detail_screen.dart';

class CreatorListItem extends StatelessWidget {
  final Creator creator;

  CreatorListItem({required this.creator});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(creator.thumbnailUrl),
      title: Text(creator.fullName),
      subtitle: Text(creator.suffix),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreatorDetailScreen(creatorId: creator.id),
          ),
        );
      },
    );
  }
}
