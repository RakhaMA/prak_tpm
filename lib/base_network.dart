// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class BaseNetwork {
//   final String _baseUrl = 'https://api.genshin.dev/characters';
//
//   Future<List<String>> getCharacters() async {
//     var response = await http.get(Uri.parse(_baseUrl));
//     if (response.statusCode == 200) {
//       return List<String>.from(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load characters');
//     }
//   }
// }
