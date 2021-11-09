import 'package:sqflite_todoapp_test/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DatabaseConnection _databaseconnection;
  Repository() {
    //db연결 이니셜라이즈
    _databaseconnection = DatabaseConnection();
  }

  static late Database _database;
//db존재하는지 확인
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _databaseconnection.setDatabase();
    return _database;
  }

  //insert data to table
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }
}
