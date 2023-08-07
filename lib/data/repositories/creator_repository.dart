import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel/data/models/creator_model.dart';
import 'package:marvel/utils/variables_net.dart';

final url = '$baseUrl/creators?apikey=$publicKey&ts=$timeStamp&hash=$hash';

class CreatorRepository {
  Future<List<CreatorModel>> fetchCreators() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> creatorList = data['data']['results'];
      return creatorList.map((json) => CreatorModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load creators');
    }
  }

  Future<CreatorModel> fetchCreatorDetails(int creatorId) async {
    final String urlCreator =
        '$baseUrl/creators/$creatorId?apikey=$publicKey&ts=$timeStamp&hash=$hash';
    final response = await http.get(Uri.parse(urlCreator));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final dynamic creatorData = data['data']['results'][0];
      return CreatorModel.fromJson(creatorData);
    } else {
      throw Exception('Failed to load creator details');
    }
  }
}
