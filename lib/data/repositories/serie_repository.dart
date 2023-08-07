import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel/data/models/serie_model.dart';
import 'package:marvel/utils/variables_net.dart';

final url = '$baseUrl/series?apikey=$publicKey&ts=$timeStamp&hash=$hash';

class SerieRepository {
  Future<List<SerieModel>> fetchSeries() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> serieList = data['data']['results'];
      return serieList.map((json) => SerieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load series');
    }
  }

  Future<List<SerieModel>> fetchMoreSeries(int offset) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/series?apikey=$publicKey&ts=$timeStamp&hash=$hash&offset=$offset'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> serieList = data['data']['results'];
      return serieList.map((json) => SerieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load more series');
    }
  }

  Future<SerieModel> fetchSerieDetails(int serieId) async {
    final String urlSerie =
        '$baseUrl/series/$serieId?apikey=$publicKey&ts=$timeStamp&hash=$hash';
    final response = await http.get(Uri.parse(urlSerie));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final dynamic serieData = data['data']['results'][0];
      return SerieModel.fromJson(serieData);
    } else {
      throw Exception('Failed to load serie details');
    }
  }
}
