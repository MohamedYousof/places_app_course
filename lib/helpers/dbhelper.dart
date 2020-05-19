import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static const createTableCommand =
      'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)';
  static Future<sql.Database> dbConnect() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, ver) {
      return db.execute(createTableCommand);
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.dbConnect();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.dbConnect();
    return db.query(table);
  }
}
