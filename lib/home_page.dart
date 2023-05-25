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
  List<String> _characters = [];

  @override
  void initState() {
    super.initState();
    _getCharacters();
  }

  void _getCharacters() async {
    var characters = await _apiDataSource.getCharacters();
    setState(() {
      _characters = characters;
    });
  }

  void _showCharacterDetails(String name) async {
    var character = await _apiDataSource.getCharacter(name);
    String imgUrl = "https://api.genshin.dev/characters/${name}/card";
    print(character);
    print(imgUrl);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailCharacter(character: character, imgUrl: imgUrl,),
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
        itemCount: _characters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_characters[index]),
            onTap: (){
              print(_characters[index]);
              _showCharacterDetails(_characters[index]);
            }
          );
        },
      ),
    );
  }
}
