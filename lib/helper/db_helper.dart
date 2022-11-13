import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/feature/home/data/models/to_do_model.dart';

class DatabaseHelper {
  static const _databaseName = "tododb.db";
  static const _databaseVersion = 1;

  static const table = 'todo_table';

  static String columnId = 'id';
  static String columnName = 'name';
  static String columnDesciption = 'desciption';
  static String columnCategoryId = 'catogoryId';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnDesciption TEXT NOT NULL,
            $columnCategoryId TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(ToDo todo) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'name': todo.name,
      'desciption': todo.desciption,
      'catogoryId': todo.catogoryId
    });
  }

  Future<int> update(ToDo todo) async {
    Database db = await instance.database;
    int id = todo.toMap()['id'];
    return await db
        .update(table, todo.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getAllRows(String catogoryId) async {
    Database db = await instance.database;
    return await db
        .query(table, where: '$columnCategoryId = ?', whereArgs: [catogoryId]);
  }
}
