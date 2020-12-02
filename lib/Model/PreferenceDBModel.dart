import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'Preference.dart';
import 'db_utils.dart';

class PreferenceModel {
  Future<int> insert(Preference p) async {
    final db = await DBUtils.init();
    return db.insert(
      'preference',
      p.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(Preference p) async {
    final db = await DBUtils.init();
    return db.update(
      'preference',
      p.toMap(),
      where: 'id = ?',
      whereArgs: [p.id],
    );
  }

  Future<Preference> getPreference() async {
    final db = await DBUtils.init();
    List<Map<String, dynamic>> map = await db.query('preference');
    if (map.length > 0) {
      return Preference.fromMap(map[0]);
    }
    return null;
  }
}
