import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  static String DbName="sefayedeksan9.db";
 static void createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE brands(id INTEGER PRIMARY KEY, name TEXT)");
    await db.execute("CREATE TABLE cartypes(id INTEGER PRIMARY KEY, name TEXT)");
    await db.execute("CREATE TABLE models(id INTEGER PRIMARY KEY, name TEXT)");
    await db.execute("CREATE TABLE histories(id INTEGER PRIMARY KEY, name TEXT,images TEXT)");
    await db.execute("CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT,price TEXT,image TEXT)");


  }
}
