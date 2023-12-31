
import 'package:sqflite/sqflite.dart';

import '../common/models/data.dart';
import 'db_helper.dart';

class DataProvider {
  static String tableName = 'data';

  static Future<List<Data>> getAllBooksData() async {
    Database db = await DatabaseHelper.instance.db;
    List<Map> maps = await db.query(tableName);

    List<Data> booksDataList = List();

    maps.forEach((element) {
      booksDataList.add(Data.fromMapObject(element));
    });

    return booksDataList;
  }

  static Future<List<Data>> getDataByBookID(int id) async {
    Database db = await DatabaseHelper.instance.db;
    List<Map> maps = await db
        .query(tableName, where: '${Data.columns[1]} = ?', whereArgs: [id]);

    List<Data> booksDataList = List();

    maps.forEach((element) {
      booksDataList.add(Data.fromMapObject(element));
    });

    return booksDataList;
  }
}
