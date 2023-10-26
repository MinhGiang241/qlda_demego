// ignore_for_file: avoid_print

import 'package:qlda_demego/models/apartment.dart';
import 'package:sqflite/sqflite.dart';

class Sqlflite {
  static final shared = Sqlflite();
  Database? database;

  Future openSQLDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/demo.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS apartment (
              _id TEXT PRIMARY KEY,
              code TEXT,
              electrical_code TEXT,
              water_code TEXT,
              regCode TEXT,
              month INT,
              year INT,
              offline_images TEXT[],
              water_head INT,
              water_last INT,
              electric_head INT,
              electric_last INT,
          );
          ''');
      },
      onOpen: (Database db) async {},
    );
    print(database);
  }

  Future closeSQLDatabase() async {
    await database!.close();
  }

  Future deleteSQLTable() async {
    var count = await database!.rawDelete('DELETE FROM apartment ');
    return count;
  }

  Future findIndicator() async {}

  Future saveApartment(
    Apartment newApartment,
    int month,
    int year,
    String regCode,
  ) async {
    var apartment = await database!.rawQuery('''
      SELECT * FROM apartment WHERE code = "${newApartment.code}"
      ''');

    print(apartment);
  }
}
