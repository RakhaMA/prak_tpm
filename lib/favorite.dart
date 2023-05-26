import 'package:shared_preferences/shared_preferences.dart';

class FavoriteManager {
  static const String _favoriteKey = 'favorite_characters';

  static Future<List<String>> getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoriteKey) ?? [];
  }

  static Future<void> addToFavorites(String character) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavorites();
    favorites.add(character);
    await prefs.setStringList(_favoriteKey, favorites);
  }

  static Future<void> removeFromFavorites(String character) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavorites();
    favorites.remove(character);
    await prefs.setStringList(_favoriteKey, favorites);
  }

  static Future<bool> isFavorite(String character) async {
    List<String> favorites = await getFavorites();
    return favorites.contains(character);
  }
}
