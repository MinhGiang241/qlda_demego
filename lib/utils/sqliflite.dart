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
              offline_images TEXT[]
              electric_last INT,
              electric_head INT,
              water_head INT,
              water_last INT,
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

  Future findAllIndicatorWithCodeAndMonth(
    int year,
    int month,
    String regCode,
  ) async {
    var list = await database!.rawQuery('''
      SELECT * FROM apartment WHERE year = $year AND month = $month AND regCode = "$regCode"
''');
    return list;
  }

  Future saveApartment(
    Apartment newApartment,
    int month,
    int year,
    String regCode,
  ) async {
    var apartments = await database!.rawQuery('''
      SELECT * FROM apartment WHERE code = "${newApartment.code}" AND year = $year AND month = $month AND regCode = "$regCode"
      ''');
    if (apartments != null && apartments.isNotEmpty) {
      var existedApartment = Apartment.fromJson(apartments[0]);

      int count = await database!.rawUpdate(
        ''' UPDATE apartment SET electric_last = ${newApartment.e?.electricity_last ?? existedApartment.e?.electricity_last ?? "NULL"},
                                 electric_head = ${newApartment.e?.electricity_head ?? existedApartment.e?.electricity_head ?? "NULL"},
                                 water_last = ${newApartment.w?.water_last ?? existedApartment.w?.water_last ?? "NULL"},
                                 water_head = ${newApartment.w?.water_head ?? existedApartment.w?.water_head ?? "NULL"}
            WHERE code = "${newApartment.code}"
              AND year = $year
              AND month = $month
              AND regCode = $regCode
        ''',
      );
      print('updated: $count');
    }

    print(apartments);
  }
}
