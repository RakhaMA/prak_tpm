import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'movies.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE movies(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            imdbId TEXT,
            title TEXT,
            year TEXT,
            plot TEXT,
            posterUrl TEXT,
            genre TEXT,
            author TEXT
          )
        ''');
      },
    );
  }

  Future<int> addToFavorite(Movie movie) async {
    final db = await instance.database;
    return await db.insert('movies', movie.toMap());
  }

  Future<List<Movie>> getFavoriteMovies() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('movies');
    return List.generate(maps.length, (i) {
      return Movie.fromMap(maps[i]);
    });
  }

  Future<void> removeFromFavorites(int id) async {
    final db = await instance.database;
    await db.delete('movies', where: 'id = ?', whereArgs: [id]);
  }
}
