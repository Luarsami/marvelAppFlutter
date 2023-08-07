import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/data/repositories/event_repository.dart';
import 'package:marvel/domain/models/event_model.dart';

class EventBloc extends Cubit<List<Event>> {
  final EventRepository repository;

  EventBloc(this.repository) : super([]);

  void getEvents() async {
    try {
      final events = await repository.fetchEvents();
      final eventList =
          events.map((model) => Event.fromEventModel(model)).toList();
      emit(eventList);
    } catch (e) {
      emit([]);
    }
  }

  void getEventDetails(int eventId) async {
    try {
      final event = await repository.fetchEventDetails(eventId);
      final eventDetail = Event.fromEventModel(event);
      emit([eventDetail]);
    } catch (e) {
      emit([]);
    }
  }
}
