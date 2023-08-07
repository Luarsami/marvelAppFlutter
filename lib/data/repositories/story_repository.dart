import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel/data/models/story_model.dart';
import 'package:marvel/utils/variables_net.dart';

final url = '$baseUrl/stories?apikey=$publicKey&ts=$timeStamp&hash=$hash';

class StoryRepository {
  Future<List<StoryModel>> fetchStories() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> storyList = data['data']['results'];
      return storyList.map((json) => StoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stories');
    }
  }

  Future<List<StoryModel>> fetchMoreStories(int offset) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/stories?apikey=$publicKey&ts=$timeStamp&hash=$hash&offset=$offset'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> storyList = data['data']['results'];
      return storyList.map((json) => StoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load more characters');
    }
  }

  Future<StoryModel> fetchStoryDetails(int storyId) async {
    final String urlStory =
        '$baseUrl/stories/$storyId?apikey=$publicKey&ts=$timeStamp&hash=$hash';
    final response = await http.get(Uri.parse(urlStory));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final dynamic storyData = data['data']['results'][0];
      return StoryModel.fromJson(storyData);
    } else {
      throw Exception('Failed to load story details');
    }
  }
}
