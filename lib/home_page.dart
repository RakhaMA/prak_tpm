import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'api_data_source.dart';
import 'detail_character.dart';
import 'favorite.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiDataSource _apiDataSource = ApiDataSource();
  Map<String, List<String>> _charactersByVision = {};

  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _getCharacters();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onNavItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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

  void _toggleFavorite(String character) async {
    bool isFavorite = await FavoriteManager.isFavorite(character);
    if (isFavorite) {
      await FavoriteManager.removeFromFavorites(character);
    } else {
      await FavoriteManager.addToFavorites(character);
    }
    setState(() {});
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

          // Get the vision logo asset path
          String visionLogoAsset = 'assets/images/visions/${vision.toLowerCase()}.png';

          return ExpansionTile(
            title: Row(
              children: [
                Image.asset(
                  visionLogoAsset,
                  height: 24.0,
                  width: 24.0,
                ),
                SizedBox(width: 8.0),
                Text(vision),
              ],
            ),
            children: characters
                .map(
                  (character) => ListTile(
                title: Text(character),
                trailing: IconButton(
                  onPressed: () => _toggleFavorite(character),
                  icon: FutureBuilder<bool>(
                    future: FavoriteManager.isFavorite(character),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        bool isFavorite = snapshot.data!;
                        return Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : null,
                        );
                      } else {
                        return Icon(Icons.favorite_border);
                      }
                    },
                  ),
                ),
                onTap: () => _showCharacterDetails(character),
              ),
            )
                .toList(),
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.favorite, size: 30),
        ],
        onTap: _onNavItemTapped,
      ),
    );
  }
}
