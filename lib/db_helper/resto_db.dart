import 'dart:io';

import 'package:exam/models/postResto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Resto_db {
  Database _db;

  init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'resto.db');
    _db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
        CREATE TABLE Post
        (
          userId INTEGER,
          id INTEGER PRIMARY KEY,
          title TEXT,
          body TEXT
        )
          """);
    });
  }

  fetchItem(int id) async {
    final maps =
        await _db.query('Post', columns: null, where: 'id=?', whereArgs: [id]);
    if (maps.length > 0) {
      return PostResto.fromMap(maps.first);
    }
    return null;
  }

  Future<List<PostResto>> fetchAll() async{
    var res = await _db.query('Post');
      List<PostResto> list =
        res.isNotEmpty ? res.map((c) => PostResto.fromMap(c)).toList() : [];
    return list;
  }


  deleteItem(int id) async{
    return await _db.delete('Post',where: 'id=?',whereArgs: [id]);
  }

  addItem(PostResto resto){
    return  _db.insert('Post', resto.toMap());
  }
}
