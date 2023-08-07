import 'package:marvel/data/repositories/event_repository.dart';
import 'package:marvel/domain/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/events/blocs/event_bloc.dart';

class EventDetail extends StatelessWidget {
  final int eventId;

  const EventDetail({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EventBloc(EventRepository())..getEventDetails(eventId),
      child: BlocBuilder<EventBloc, List<Event>>(
        builder: (context, events) {
          if (events.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          final event = events.firstWhere((char) => char.id == eventId);

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          event.thumbnailUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                            .toDouble()
                                    : null,
                              );
                            }
                          },
                          height: 350,
                        )),
                    const SizedBox(height: 16),
                    Text(
                      event.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      event.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
