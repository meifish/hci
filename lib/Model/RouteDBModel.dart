import 'dart:async';
import 'package:sqflite/sqflite.dart';

import 'db_utils.dart';
import 'Route.dart';

class RouteModel {
  Future<int> insertRoute(MyRoute r) async {
    final db = await DBUtils.init();
    return db.insert(
      'myRoute',
      r.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateRoute(MyRoute r) async {
    final db = await DBUtils.init();
    return db.update('myRoute', r.toMap(), where: 'id = ?', whereArgs: [r.id]);
  }

  Future<void> deleteRoute(int id) async {
    final db = await DBUtils.init();
    return db.delete('myRoute', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllRoutes() async {
    final db = await DBUtils.init();
    return db.delete('myRoute');
  }

  Future<List<MyRoute>> getAllRoutes() async {
    final db = await DBUtils.init();
    final List<Map<String, dynamic>> returnMap = await db.query('myRoute');
    List<MyRoute> result = [];

    if (returnMap.length > 0) {
      for (int i = 0; i < returnMap.length; i++) {
        result.add(MyRoute.fromMap(returnMap[i])); // q
      }
      print(result);
    }

    return result;
  }

  Future<MyRoute> getRouteWithId(int id) async {
    final db = await DBUtils.init();
    final List<Map<String, dynamic>> maps = await db.query(
      'myRoute',
      where: 'id = ?',
      whereArgs: [id],
    );
    return MyRoute.fromMap(maps[0]);
  }
}
