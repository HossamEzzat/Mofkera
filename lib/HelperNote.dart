import 'package:mofkraaa/model/todoModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io' as io;

class Note {

  static   Database? _db;

  static Future<Database?> get db async{
    if(_db==null){
      _db=await initialdb();
      return _db;
    }else{
      return _db;
    }

  }

 static initialdb() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String Path = join(directory.path, "todoListt.db");

    var mydb = await openDatabase(Path, version: 2, onCreate: _onCreate);
    return mydb;
  }

static  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE todo (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,description TEXT NOT NULL,title TEXT NOT NULL, date TEXT NOT NULL,done TEXT NOT NULL )");
    print("todoTABLE created");
  }

 static Future <int> insertdb(Map<String,dynamic>data)async{
    Database? db_clint=await db;
    var reselt =await db_clint!.insert("todo", data);
    return reselt;
  }

static  Future <int> deletedb(int id) async {
    Database? db_clint = await db;
    var reselt = await db_clint!.rawUpdate("DELETE FROM todo WHERE id='$id'");
    return reselt;
  }

 static Future <int> updatetodo(String note, int id) async {
    Database? db_clint = await db;
    var reselt = await db_clint!.rawUpdate(
        "UPDATE todo FROM  SET description='$note' WHERE id=$id");
    return reselt;
  }
 Future<List<todoModel>>getdata()async{
    Database? db_clint=await db;
    List<todoModel>list=[];
    var reselt =await db_clint!.query("todo");
    print(reselt);
    for(var i in reselt){
      todoModel tmodel=todoModel(i['id'],i['done'],i['date'],i['title'],i['description']);
      list.add(tmodel);
    }
    return list;
  }

 static Future <List> getSingelRow(int id) async {
    Database? db_clint = await db;
    var reselt = await db_clint!.query("todo", where: 'id=$id');
    return reselt;
  }
}