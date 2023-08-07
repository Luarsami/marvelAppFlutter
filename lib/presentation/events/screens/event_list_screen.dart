import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/event_model.dart';
import 'package:marvel/data/repositories/event_repository.dart';
import 'package:marvel/presentation/events/blocs/event_bloc.dart';
import 'package:marvel/presentation/events/widgets/event_list_item.dart';

class EventListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc(EventRepository())..getEvents(),
      child: Scaffold(
        appBar: AppBar(title: Text('Marvel Events')),
        body: EventList(),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, List<Event>>(
      builder: (context, events) {
        if (events.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return EventListItem(event: event);
          },
        );
      },
    );
  }
}
