// lib/services/database_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/recipe_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'recipes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY, title TEXT, imageUrl TEXT, summary TEXT, readyInMinutes INTEGER, healthScore INTEGER, originalIngredients TEXT)',
        );
      },
    );
  }

  Future<void> insertFavorite(RecipeModel recipe) async {
    final db = await database;
    await db.insert(
      'favorites',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteFavorite(int id) async {
    final db = await database;
    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<RecipeModel>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return List.generate(maps.length, (i) {
      return RecipeModel.fromMap(maps[i]);
    });
  }
}
