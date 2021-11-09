import 'package:flutter/material.dart';
import 'package:sqflite_todoapp_test/models/category.dart';
import 'package:sqflite_todoapp_test/screens/home_screen.dart';
import 'package:sqflite_todoapp_test/service/category_service.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();
  var _category = Category();

  var _categoryService = CategoryService();
  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (param) {
          return AlertDialog(
            actions: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.cancel),
                  label: Text('취소')),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                onPressed: () async {
                  // print('카테고리 네임:${_categoryNameController.text}');
                  // print('카테고리 설명:${_categoryDescriptionController.text}');
                  _category.name = _categoryNameController.text;
                  _category.description = _categoryDescriptionController.text;
                  var result = _categoryService.saveCategory(_category);
                  print(result);
                },
                icon: Icon(Icons.save),
                label: Text('저장'),
              )
            ],
            title: Text('카테고리 폼'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _categoryNameController,
                    decoration: InputDecoration(
                      hintText: '카테고리 제목을 쓰세요',
                      labelText: '카테고리 제목',
                    ),
                  ),
                  TextField(
                    controller: _categoryDescriptionController,
                    decoration: InputDecoration(
                      hintText: '카테고리 설명을 쓰세요',
                      labelText: '카테고리 설명',
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          ),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Categories'),
      ),
      body: Center(child: Text('안녕 카테고리페이지야')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFormDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
