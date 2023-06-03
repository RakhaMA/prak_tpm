class Movie {
  final String imdbId;
  final String title;
  final String year;
  final String plot;
  final String posterUrl;
  final String genre;

  Movie({
    required this.imdbId,
    required this.title,
    required this.year,
    required this.plot,
    required this.posterUrl,
    required this.genre,
  });

  factory Movie.fromJson(String imdbId, Map<String, dynamic> json) {
    return Movie(
      imdbId: imdbId,
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      plot: json['Plot'] ?? '',
      posterUrl: json['Poster'] ?? '',
      genre: json['Genre'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imdbID': imdbId,
      'Title': title,
      'Year': year,
      'Plot': plot,
      'Poster': posterUrl,
      'Genre': genre,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'imdbId': imdbId,
      'title': title,
      'year': year,
      'plot': plot,
      'posterUrl': posterUrl,
      'genre': genre,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      imdbId: map['imdbId'],
      title: map['title'],
      year: map['year'],
      plot: map['plot'],
      posterUrl: map['posterUrl'],
      genre: map['genre'],
    );
  }
}
