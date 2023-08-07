import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel/data/models/character_model.dart';
import 'package:marvel/utils/variables_net.dart';

final url = '$baseUrl/characters?apikey=$publicKey&ts=$timeStamp&hash=$hash';

class CharacterRepository {
  Future<List<CharacterModel>> fetchCharacters() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> characterList = data['data']['results'];
      return characterList
          .map((json) => CharacterModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<CharacterModel> fetchCharacterDetails(int characterId) async {
    final String urlCharacter =
        '$baseUrl/characters/$characterId?apikey=$publicKey&ts=$timeStamp&hash=$hash';
    final response = await http.get(Uri.parse(urlCharacter));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final dynamic characterData = data['data']['results'][0];
      return CharacterModel.fromJson(characterData);
    } else {
      throw Exception('Failed to load character details');
    }
  }
}
