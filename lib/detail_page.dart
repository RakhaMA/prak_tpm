import 'package:flutter/material.dart';
import 'model.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;

  const DetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.posterUrl.isNotEmpty)
              Image.network(movie.posterUrl),
            SizedBox(height: 16.0),
            Text(
              'Title: ${movie.title}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Year: ${movie.year}'),
            SizedBox(height: 8.0),
            Text('Genre: ${movie.genre}'),
            SizedBox(height: 8.0),
            Text('Plot: ${movie.plot}'),
          ],
        ),
      ),
    );
  }
}
