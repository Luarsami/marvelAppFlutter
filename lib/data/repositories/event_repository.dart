import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel/data/models/event_model.dart';
import 'package:marvel/utils/variables_net.dart';

final url = '$baseUrl/events?apikey=$publicKey&ts=$timeStamp&hash=$hash';

class EventRepository {
  Future<List<EventModel>> fetchEvents() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> eventList = data['data']['results'];
      return eventList.map((json) => EventModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<List<EventModel>> fetchMoreEvents(int offset) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/events?apikey=$publicKey&ts=$timeStamp&hash=$hash&offset=$offset'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> eventList = data['data']['results'];
      return eventList.map((json) => EventModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load more events');
    }
  }

  Future<EventModel> fetchEventDetails(int eventId) async {
    final String urlEvent =
        '$baseUrl/events/$eventId?apikey=$publicKey&ts=$timeStamp&hash=$hash';
    final response = await http.get(Uri.parse(urlEvent));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final dynamic eventData = data['data']['results'][0];
      return EventModel.fromJson(eventData);
    } else {
      throw Exception('Failed to load event details');
    }
  }
}
