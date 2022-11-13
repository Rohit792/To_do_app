import 'package:to_do_app/feature/home/data/repository/home_repository_impl.dart';

class HomeRepositoryBuilder {
  static HomeRepository repository() {
    return HomeRepositoryImpl();
  }
}

abstract class HomeRepository {
  Future<void> insertData(String name, String disciption, String categoryId);
  Future<List<Map<String, dynamic>>> getAllData(String catogoryId);
  Future<void> updateData(
      String name, String disciption, String updateId, String categoryId);
  Future<void> deleteData(int id);
}
