import 'package:flutter/material.dart';

import 'api_data_source.dart';
import 'detail_character.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiDataSource _apiDataSource = ApiDataSource();
  Map<String, List<String>> _charactersByVision = {};

  @override
  void initState() {
    super.initState();
    _getCharacters();
  }

  void _getCharacters() async {
    var characters = await _apiDataSource.getCharacters();

    // Categorize characters by their Vision
    for (var character in characters) {
      String vision = await _apiDataSource.getCharacterVision(character);
      if (_charactersByVision.containsKey(vision)) {
        _charactersByVision[vision]?.add(character);
      } else {
        _charactersByVision[vision] = [character];
      }
    }

    setState(() {});
  }

  void _showCharacterDetails(String name) async {
    var character = await _apiDataSource.getCharacter(name);
    String imgUrl = "https://api.genshin.dev/characters/$name/card";
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailCharacter(
          character: character,
          imgUrl: imgUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genshin Characters'),
      ),
      body: ListView.builder(
        itemCount: _charactersByVision.keys.length,
        itemBuilder: (context, index) {
          String vision = _charactersByVision.keys.elementAt(index);
          List<String> characters = _charactersByVision[vision] ?? [];

          return ExpansionTile(
            title: Text(vision),
            children: characters
                .map(
                  (character) => ListTile(
                title: Text(character),
                onTap: () => _showCharacterDetails(character),
              ),
            )
                .toList(),
          );
        },
      ),
    );
  }
}
