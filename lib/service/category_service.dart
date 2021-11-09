import 'package:sqflite_todoapp_test/models/category.dart';
import 'package:sqflite_todoapp_test/repositories/repository.dart';

class CategoryService {
  late Repository _repository;

  CategoryService() {
    _repository = Repository();
  }
  saveCategory(Category category) async {
    return await _repository.insertData('categories', category.categoryMap());
//왼쪽은   _onCreatingDatabase(Database database, int version) async {
    //   await database.execute(
    //       'CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT,description TEXT)');
    // }
    //여기서 만든 테이블 이름 오른쪽은 데이터 넣는거
  }
}
