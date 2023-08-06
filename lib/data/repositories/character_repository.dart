import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/character_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:crypto/crypto.dart';

final baseUrl = dotenv.dotenv.get('API_URL');
final publicKey = dotenv.dotenv.get('PUBLIC_KEY');
final privateKey = dotenv.dotenv.get('PRIVATE_KEY');

String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
String hash =
    md5.convert(utf8.encode('$timeStamp$privateKey$publicKey')).toString();
String url = '$baseUrl/characters?apikey=$publicKey&ts=$timeStamp&hash=$hash';

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
    String urlCharacter =
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
