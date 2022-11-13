import 'package:to_do_app/helper/db_helper.dart';

class ToDo {
  int? id;
  String? name;
  String? desciption;
  String? catogoryId;

  ToDo(this.id, this.name, this.desciption, this.catogoryId);

  ToDo.fromMap(Map<String, dynamic> map) {
    id = map['id'] == null ? null : int.parse(map['id'].toString());
    name = map['name'];
    desciption = map['desciption'];
    catogoryId = map['catogoryId'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnDesciption: desciption,
      DatabaseHelper.columnCategoryId: catogoryId,
    };
  }
}
