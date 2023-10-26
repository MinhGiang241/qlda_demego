// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:qlda_demego/services/api/api_tech_offline.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../../models/apartment.dart';
import '../../../utils/utils.dart';

class OfflineTechPrv extends ChangeNotifier {
  OfflineTechPrv({required this.context}) {}
  BuildContext context;
  List<Apartment> apartmentList = [];
  bool isLoading = false;
  Database? database;

  Future getApartmentList(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await APITechOffline.getAllApartments().then((v) async {
      apartmentList.clear();
      //await openSQLDatabase();
      if (v != null) {
        for (var i in v) {
          var apart = Apartment.fromJson(i);
          print(apart);
          await database!.transaction((txn) async {
            await txn.rawInsert('''
            INSERT INTO demo (_id, code, electrical_code, water_code)
            VALUES (  "${apart.id}","${apart.code}", "${apart.electrical_code}", "${apart.water_code}")
            ''');
          });
        }
      }

      notifyListeners();
    }).catchError((err) {
      Utils.showErrorMessage(context, err);
    });
  }

  getAllApartmentFromSQL() async {
    var list = await database!.rawQuery('SELECT * FROM demo;');
    apartmentList.clear();

    for (var i in list) {
      apartmentList.add(
        Apartment(
          id: i['_id'] as String?,
          code: i['code'] as String?,
          electrical_code: i['electrical_code'] as String?,
          water_code: i['water_code'] as String?,
        ),
      );
    }

    print(apartmentList);
    notifyListeners();
  }

  dropTable() async {
    await database!.rawQuery('DROP DATABASE "demo";');
  }

  deleteTable() async {
    var list = await database!.rawQuery('DELETE  FROM demo ');
    print(list);
  }

  getTable() async {
    var list = await database!.rawQuery('SELECT *  FROM demo ;');
    print(list);
  }
  // SQL

  Future openSQLDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/demo.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS demo (
              _id TEXT  PRIMARY KEY,
              code TEXT,
              electrical_code TEXT,
              water_code TEXT
          );
''');
      },
      onOpen: (Database db) async {},
    );
    print(database);
  }

  Future findSQLDatabase() async {
    var list = await database!.rawQuery('''
      SELECT * FROM "demo" WHERE code = "CH1"

      ''');
    apartmentList.clear();
    print(list);
    for (var i in list) {
      apartmentList.add(Apartment.fromJson(i));
    }
    notifyListeners();
  }
}
