import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class ApiDataSource {
  static const String apiKey = 'cdce484f';

  Future<List<Movie>> fetchMovies(String searchQuery) async {
    final response = await http.get(
      Uri.parse('http://www.omdbapi.com/?apikey=$apiKey&s=$searchQuery'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> moviesData = jsonData['Search'];
      final List<Movie> movies = [];

      for (var movieData in moviesData) {
        final String imdbId = movieData['imdbID'];
        final detailsResponse = await http.get(
          Uri.parse('http://www.omdbapi.com/?apikey=$apiKey&i=$imdbId'),
        );

        if (detailsResponse.statusCode == 200) {
          final detailsJsonData = jsonDecode(detailsResponse.body);
          movies.add(Movie.fromJson(imdbId, detailsJsonData));
        }
      }

      return movies;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

}
