import 'package:sqflite/sqflite.dart';
import 'class_penangkap.dart';
import 'access_db.dart';

class CRUD {
  AccessDb dbHelper = new AccessDb();
  Future<int> insert(ClassPenangkap todo) async {
    Database db = await dbHelper.initDb();
    int count = await db.insert('contact', todo.toMap());
    return count;
  }

  Future<int> update(ClassPenangkap todo) async {
    Database db = await dbHelper.initDb();
    int count = await db
        .update('contact', todo.toMap(), where: 'id=?', whereArgs: [todo.id]);
    return count;
  }

  Future<int> delete(ClassPenangkap todo) async {
    Database db = await dbHelper.initDb();
    int count = await db.delete('contact', where: 'id=?', whereArgs: [todo.id]);
    return count;
  }

  Future<List<ClassPenangkap>> getContactList() async {
    Database db = await dbHelper.initDb();
    List<Map<String, dynamic>> mapList =
        await db.query('contact', orderBy: 'name');
    int count = mapList.length;
    List<ClassPenangkap> contactList = List<ClassPenangkap>();
    for (int i = 0; i < count; i++) {
      contactList.add(ClassPenangkap.fromMap(mapList[i]));
    }
    return contactList;
  }
}
