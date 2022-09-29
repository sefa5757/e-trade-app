import 'package:flutter/cupertino.dart';
import 'package:odev/models/Histories.dart';
import 'package:odev/models/car_type.dart';
import 'package:odev/utils/dbHelper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class HistoriesDbHelper {
  static final HistoriesDbHelper _dbHelper = HistoriesDbHelper._internal();
  String tbl = "histories";
  String colId = "id";
  String colName = "name";
  String colName1="images";

  HistoriesDbHelper._internal();

  factory HistoriesDbHelper() {
    return _dbHelper;
  }

  static Database? _db;
  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + DbHelper.DbName;
    var dbEntitys = await openDatabase(path, version: 1, onCreate: DbHelper.createDb);
    return dbEntitys;
  }



  Future<int> insertEntity(Histories entity) async {
    var db = await this.db;
    var result = await db!.insert(tbl, entity.toMap());
    return result;
  }

  Future<List> getEntities() async {
    List<Histories> entityList = <Histories>[];
    var db = await this.db;
    var result =
        await db!.rawQuery("SELECT * FROM $tbl");
    for (var element in result) {
      entityList.add(Histories.fromObject(element));
    }
    return entityList;
  }

  Future<int?> getCount() async {
    var db = await this.db;
    var result = Sqflite.firstIntValue(
        await db!.rawQuery("SELECT COUNT(*) FROM $tbl"));

    return result;
  }

  Future<int> updateEntity(Histories entity) async {
    var db = await this.db;
    var result = await db!.update(tbl, entity.toMap(),
        where: "$colId = ?", whereArgs: [entity.id]);
    return result;
  }


  Future<int> deleteEntity(int id) async {
    var db = await this.db;
    var result = await db!.delete(tbl,  where: "$colId = ?", whereArgs: [id]);
    return result;
  }
}