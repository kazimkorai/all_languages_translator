

import 'package:all_languages_translator/pojo/MyDataModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart' as p;

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE Bookmarks(id INTEGER PRIMARY KEY, input TEXT, output TEXT )");
    print("Table is created");
  }

  //insertion
  Future<int> saveUser(MyDataModel myDataModel) async {
    var dbClient = await db;
    int res = await dbClient.insert("Bookmarks", myDataModel.toMap());
    print(res.toString());
    return res;
  }

  //deletion
  Future<int> deleteUsers(MyDataModel myDataModel) async {
    var dbClient = await db;

    int res =
    await dbClient.rawDelete('DELETE FROM Bookmarks WHERE id = ?', [myDataModel.id]);
    return res;
  }

  Future<List<MyDataModel>> getAllBookmarks() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Bookmarks');
    List<MyDataModel> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
      new MyDataModel(list[i]["input"], list[i]["output"]);
      user.setId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }




}