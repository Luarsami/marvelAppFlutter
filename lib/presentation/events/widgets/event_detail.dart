import 'package:marvel/data/repositories/event_repository.dart';
import 'package:marvel/domain/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/events/blocs/event_bloc.dart';

class EventDetail extends StatelessWidget {
  final int eventId;

  EventDetail({required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EventBloc(EventRepository())..getEventDetails(eventId),
      child: BlocBuilder<EventBloc, List<Event>>(
        builder: (context, events) {
          if (events.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          final event = events.firstWhere((char) => char.id == eventId);

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Image.network(event.thumbnailUrl),
                SizedBox(height: 16),
                Text(
                  event.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(event.description)
              ],
            ),
          );
        },
      ),
    );
  }
}
