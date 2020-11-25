import 'dart:async';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBUtils {
  static Future<Database> init() async {
    var database = openDatabase(
      path.join(await getDatabasesPath(), 'MyRoutesDB.db'),
      onCreate: (db, version) {
        db.execute("CREATE TABLE myRoute(" +
            "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
            "name TEXT, " +
            "img TEXT, " +
            "floor1 INTEGER, " +
            "floor2 INTEGER, " +
            "isAnytime INTEGER DEFAULT 1, " +
            "timeFrom TEXT DEFAULT '00:00', " +
            "timeTo TEXT DEFAULT '23:59', " +
            "sun INTEGER DEFAULT 1, " +
            "mon INTEGER DEFAULT 1, " +
            "tue INTEGER DEFAULT 1, " +
            "wed INTEGER DEFAULT 1, " +
            "thu INTEGER DEFAULT 1, " +
            "fri INTEGER DEFAULT 1, " +
            "sat INTEGER DEFAULT 1 " +
            ")");
      },
      version: 1,
    );
    return database;
  }

  static Future<Database> delete(String dbName) async {
    var databasesPath = await getDatabasesPath();
    var dbpath = path.join(databasesPath, dbName);
    await deleteDatabase(dbpath);
  }
}
