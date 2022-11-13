import 'package:to_do_app/feature/home/data/models/to_do_model.dart';
import 'package:to_do_app/feature/home/domain/repositories/home_repository_builder.dart';
import 'package:to_do_app/helper/db_helper.dart';

class HomeRepositoryImpl extends HomeRepository {
  final dbHelper = DatabaseHelper.instance;

  @override
  Future<void> insertData(
      String name, String disciption, String categoryId) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnDesciption: disciption,
      DatabaseHelper.columnCategoryId: categoryId
    };
    ToDo todo = ToDo.fromMap(row);
    final id = await dbHelper.insert(todo);
  }

  @override
  Future<List<Map<String, dynamic>>> getAllData(String catogoryId) async {
    final getAllRows = await dbHelper.getAllRows(catogoryId);

    return getAllRows;
  }

  @override
  Future<void> deleteData(int id) async {
    final result = await dbHelper.delete(id);
    print("deleted : $result");
  }

  @override
  Future<void> updateData(String name, String disciption, String updateId,
      String categoryId) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: updateId,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnDesciption: disciption,
      DatabaseHelper.columnCategoryId: categoryId
    };
    ToDo todo = ToDo.fromMap(row);
    final id = await dbHelper.update(todo);
    print("Inserted : $id");
  }
}
