import 'package:flutter/material.dart';

import 'model.dart';

class DetailCharacter extends StatelessWidget {
  final Character character;
  final String imgUrl;

  DetailCharacter({required this.character, required this.imgUrl}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vision: ${character.vision}'),
            Text('Weapon: ${character.weapon}'),
            Text('Nation: ${character.nation}'),
            Text('Affiliation: ${character.affiliation}'),
            Text('Rarity: ${character.rarity}'),
            Text('Constellation: ${character.constellation}'),
            Image.network(imgUrl),
          ],
        ),
      ),
    );
  }
}

