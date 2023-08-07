import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel/data/models/comic_model.dart';
import 'package:marvel/utils/variables_net.dart';

final url = '$baseUrl/comics?apikey=$publicKey&ts=$timeStamp&hash=$hash';

class ComicRepository {
  Future<List<ComicModel>> fetchComics() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> comicList = data['data']['results'];
      return comicList.map((json) => ComicModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comics');
    }
  }

  Future<ComicModel> fetchComicDetails(int comicId) async {
    final String urlComic =
        '$baseUrl/comics/$comicId?apikey=$publicKey&ts=$timeStamp&hash=$hash';
    final response = await http.get(Uri.parse(urlComic));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final dynamic comicData = data['data']['results'][0];
      return ComicModel.fromJson(comicData);
    } else {
      throw Exception('Failed to load comic details');
    }
  }
}
