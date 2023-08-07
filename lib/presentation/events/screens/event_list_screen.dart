import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/domain/models/event_model.dart';
import 'package:marvel/data/repositories/event_repository.dart';
import 'package:marvel/presentation/events/blocs/event_bloc.dart';
import 'package:marvel/presentation/events/widgets/event_list_item.dart';

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc(EventRepository())..getEvents(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Marvel Events')),
        body: const EventList(),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return BlocBuilder<EventBloc, List<Event>>(
      builder: (context, events) {
        if (events.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final eventBloc = BlocProvider.of<EventBloc>(context);

        scrollController.addListener(() {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            eventBloc.loadMoreEvents();
          }
        });

        return ListView.builder(
          controller: scrollController,
          itemCount: events.length + 1,
          itemBuilder: (context, index) {
            if (index < events.length) {
              final event = events[index];
              return EventListItem(event: event);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
