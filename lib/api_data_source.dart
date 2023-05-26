import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class ApiDataSource {
  final String _baseUrl = 'https://api.genshin.dev/characters';

  Future<List<String>> getCharacters() async {
    var response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<Character> getCharacter(String name) async {
    var response = await http.get(Uri.parse('$_baseUrl/$name'));
    if (response.statusCode == 200) {
      return Character.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load character');
    }
  }

  Future<String> getCharacterVision(String name) async {
    var response = await http.get(Uri.parse('$_baseUrl/$name'));
    if (response.statusCode == 200) {
      var characterData = json.decode(response.body);
      return characterData['vision'];
    } else {
      throw Exception('Failed to load character vision');
    }
  }
}

