// import 'package:flutter/material.dart';
// import 'base_network.dart';
// import 'model.dart';
//
// class CharactersList extends StatelessWidget {
//   final BaseNetwork baseNetwork = BaseNetwork();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Characters'),
//       ),
//       body: FutureBuilder<List<Character>>(
//         future: _fetchCharacters(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final characters = snapshot.data!;
//             return ListView.builder(
//               itemCount: characters.length,
//               itemBuilder: (context, index) {
//                 final character = characters[index];
//                 return ListTile(
//                   title: Text(character.name),
//                   subtitle: Text(character.vision),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Failed to load data'));
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
//
//   Future<List<Character>> _fetchCharacters() async {
//     final response = await baseNetwork.get('characters');
//     final List<dynamic> charactersJson = response;
//     return charactersJson.map((json) => Character.fromJson(json)).toList();
//   }
// }
