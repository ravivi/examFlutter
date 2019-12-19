import 'dart:io' as io;

import 'package:flutter/material.dart';

import '../models/postResto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NOM = 'nom';
  static const String VILLE = 'ville';
  static const String COMMUNE = 'commune';
  static const String TYPE = 'type';
  static const String SIGLE = 'sigle';
  static const String NUMERO = 'numero';
  static const String IMAGE = 'image';
  static const String TABLE = 'resto';
  static const String DB_NAME = 'grandresto.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $NOM TEXT, $VILLE TEXT,$COMMUNE TEXT, $TYPE TEXT, $SIGLE TEXT, $NUMERO TEXT, $IMAGE TEXT)");
  }

  Future<PostResto> save(PostResto resto) async{
    var dbClient = await db;
    resto.id = await dbClient.insert(TABLE, resto.toMap());
    return resto;
    // await dbClient.transaction((txn) async{
    //   var query = "INSERT INTO $TABLE($NOM,$SIGLE,$TYPE,$NUMERO,$VILLE, $COMMUNE,$IMAGE) VALUES ('""')";
    //   return await txn.rawInsert(query);
    // });
  }
  Future<List<PostResto>> getResto() async{
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID,NOM,SIGLE,TYPE,NUMERO,VILLE,COMMUNE,IMAGE]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<PostResto> restos = [];
    if (maps.length>0) {
      for(int i =0 ; i< maps.length; i++){
        restos.add(PostResto.fromMap(maps[i]));
      }
    }
    return restos;
  }

  Future<int> delete(int id) async{
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future <int> update(PostResto resto) async{
    var dbClient = await db;
    return await dbClient.update(TABLE, resto.toMap(), where: '$ID = ?', whereArgs: [resto.id]);
  }
  Future close() async {
    var dbClient = await db;
    return await dbClient.close();
  }
}
