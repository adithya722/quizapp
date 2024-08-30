// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:project2/db/models/details.dart';
import 'package:sqflite/sqflite.dart';

late Database _db;

Future<void> initializeDataBase() async {
  _db = await openDatabase('details.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE details(name TEXT,email TEXT PRIMARY KEY,age,password TEXT)');
  });
}

Future<dynamic> getAllDetails() async {
  final List<Map<String, dynamic>> _values =
      await _db.rawQuery('SELECT * FROM  details');
  print(_values);
  return _values;
}

Future<void> addDetails(UserDetails value) async {
  int id = await _db.insert('details', value.toMap());

  print(id);

  final List<Map<String, dynamic>> _values =
      await _db.rawQuery('SELECT * FROM  details');
  print(_values);
}
