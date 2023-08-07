import 'package:flutter/material.dart';
import 'package:marvel/domain/models/creator_model.dart';
import 'package:marvel/presentation/creators/screens/creator_detail_screen.dart';

class CreatorListItem extends StatelessWidget {
  final Creator creator;

  const CreatorListItem({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            creator.thumbnailUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!.toDouble()
                      : null,
                );
              }
            },
            width: 60,
          ),
        ),
        title: Text(creator.fullName,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontStyle: FontStyle.normal)),
        subtitle: Text(creator.suffix,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontStyle: FontStyle.normal)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatorDetailScreen(creatorId: creator.id),
            ),
          );
        },
      ),
    );
  }
}
