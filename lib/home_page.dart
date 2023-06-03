import 'package:flutter/material.dart';
import 'api_data_source.dart';
import 'database.dart';
import 'model.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiDataSource apiDataSource = ApiDataSource();
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;
  List<Movie> movies = [];
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  Future<void> fetchMovies(String searchQuery) async {
    try {
      final List<Movie> fetchedMovies = await apiDataSource.fetchMovies(searchQuery);
      setState(() {
        movies = fetchedMovies;
      });
    } catch (e) {
      print('Failed to fetch movies: $e');
    }
  }

  Future<void> addToFavorite(Movie movie) async {
    try {
      final int id = await databaseHelper.addToFavorite(movie);
      if (id > 0) {
        print('Added to favorites');
      } else {
        print('Failed to add to favorites');
      }
    } catch (e) {
      print('Failed to add to favorites: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Enter a movie title',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    final String searchQuery = searchController.text.trim();
                    if (searchQuery.isNotEmpty) {
                      fetchMovies(searchQuery);
                    }
                  },
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final Movie movie = movies[index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.year),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      addToFavorite(movie);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(movie: movie),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
