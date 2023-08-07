import 'package:flutter/material.dart';
import 'package:marvel/domain/models/event_model.dart';
import 'package:marvel/presentation/events/screens/event_detail_screen.dart';

class EventListItem extends StatelessWidget {
  final Event event;

  EventListItem({required this.event});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(event.thumbnailUrl),
      title: Text(event.title),
      subtitle: Text(event.description),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailScreen(eventId: event.id),
          ),
        );
      },
    );
  }
}
