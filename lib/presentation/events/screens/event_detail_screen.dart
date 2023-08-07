import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/events/blocs/event_bloc.dart';
import 'package:marvel/data/repositories/event_repository.dart';
import 'package:marvel/presentation/events/widgets/event_detail.dart';

class EventDetailScreen extends StatelessWidget {
  final int eventId;

  EventDetailScreen({required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc(EventRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Event Details')),
        body: EventDetail(eventId: eventId),
      ),
    );
  }
}
