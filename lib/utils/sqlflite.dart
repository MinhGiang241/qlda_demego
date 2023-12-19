// ignore_for_file: avoid_print

import 'package:qlda_demego/models/apartment.dart';
import 'package:sqflite/sqflite.dart';

class SqlfliteServices {
  static final shared = SqlfliteServices();
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
              month INTEGER,
              year INTEGER,
              offline_images_e TEXT,
              offline_images_w TEXT,
              electric_last INTEGER,
              electric_head INTEGER,
              water_head INTEGER,
              water_last INTEGER
          );
          ''');
      },
      onOpen: (Database db) async {},
    );
    print(database);
  }

  Future deleteAll() async {
    await database!.rawDelete('''
DELETE FROM apartment
''');
  }

  Future closeSQLDatabase() async {
    await database!.close();
  }

  Future deleteDataWhenFinishSend(
    String dataIds,
    int year,
    int month,
    String regCode,
    bool isElectric,
  ) async {
    if (isElectric) {
      await database!.rawUpdate('''
      UPDATE apartment SET electric_last = NULL ,
                                             electric_head = NULL
                                      WHERE _id In ($dataIds)
                                       AND year = $year
                                  AND month = $month
                                  AND regCode = "$regCode"
      ''');
    } else {
      await database!.rawUpdate('''
      UPDATE apartment SET water_last = NULL ,
                                             water_head = NULL
                                      WHERE _id In ($dataIds)
                                      AND year = $year
                                      AND month = $month
                                      AND regCode = "$regCode"
      ''');
    }

    await database!.rawDelete('''
      DELETE FROM apartment WHERE 
                                   year = $year
                                  AND month = $month
                                  AND regCode = "$regCode"
                                  AND water_last IS NULL
                                  AND water_head IS NULL
                                  AND electric_last IS NULL
                                  AND electric_head IS NULL
      ''');
  }

  findAllIndicatorWithCodeAndMonthWithFilter(
    int year,
    int month,
    int limit,
    int skip,
    String regCode,
    String search,
  ) async {
    var list = await database!.rawQuery('''
SELECT * FROM apartment WHERE 
                            year = $year 
                            AND month = $month 
                            AND regCode = "${regCode.isEmpty ? '' : regCode}" 
                            AND code LIKE  '%$search%'  
                LIMIT $limit
                OFFSET $skip
''');
    return list;
  }

  Future findAllIndicatorWithCodeAndMonth(
    int year,
    int month,
    String regCode,
  ) async {
    var list = await database!.rawQuery('''
      SELECT * FROM apartment WHERE year = $year AND month = $month AND regCode = "${regCode.isEmpty ? '' : regCode}"
''');
    return list;
  }

  Future saveApartment(
    Apartment newApartment,
    int month,
    int year,
    String regCode,
    bool isElectric,
  ) async {
    var apartments = await database!.rawQuery('''
      SELECT * FROM apartment WHERE code = "${newApartment.code}" AND year = $year AND month = $month AND regCode = "${regCode.isEmpty ? "" : regCode}"
      ''');
    if (apartments.length >= 1) {
      //var existedApartment = ApartmentFromSQL.fromMap(apartments[0]);

      int count = await database!.rawUpdate(
        ''' UPDATE apartment SET
                                 ${isElectric ? '''

                                                   electric_last = ${newApartment.e?.electricity_last ?? "NULL"}, 
                                 electric_head = ${newApartment.e?.electricity_head ?? "NULL"},
                                 offline_images_e = ${newApartment.e?.offline_image == null ? 'NULL' : newApartment.e!.offline_image!.isEmpty ? "''" : '"${newApartment.e?.offline_image!.map((i) => i.path).join(',')}"'}
                                 
                                  ''' : '''

                                  water_last = ${newApartment.w?.water_last ?? "NULL"},
                                 water_head = ${newApartment.w?.water_head ?? "NULL"},
                                 offline_images_w = ${newApartment.e?.offline_image == null ? 'NULL' : newApartment.e!.offline_image!.isEmpty ? "''" : '"${newApartment.e?.offline_image!.map((i) => i.path).join(',')}"'}
                                 
                                  '''}               
            WHERE code = "${newApartment.code}"
              AND year = $year
              AND month = $month
              AND regCode = ${regCode.isEmpty ? '""' : regCode}
        ''',
      );
      print('updated: $count');
    } else {
      await database!.transaction((txn) async {
        int id1 = await txn.rawInsert('''
            INSERT INTO apartment(
              _id,
              code,
              electrical_code,
              water_code,
              ${isElectric ? '''
              electric_last, 
              electric_head,
              offline_images_e ,
              ''' : '''
              water_last, 
              water_head,
              offline_images_w,
              '''}
              
               year, month, regCode)
                   VALUES (
                    "${newApartment.id}",
                    "${newApartment.code}",                 
                    "${newApartment.electrical_code}",
                    "${newApartment.water_code}",

                          ${isElectric ? '''
                              ${newApartment.e?.electricity_last?.toInt() ?? 'NULL'},
                              ${newApartment.e?.electricity_head?.toInt() ?? 'NULL'},
                              ${newApartment.e?.offline_image == null ? 'NULL' : newApartment.e!.offline_image!.isEmpty ? "''" : "'${newApartment.e?.offline_image!.map((i) => i.path).join(',')}'"},
                            ''' : '''
                              ${newApartment.w?.water_last?.toInt() ?? 'NULL'},
                              ${newApartment.w?.water_head?.toInt() ?? 'NULL'},
                              ${newApartment.w?.offline_image == null ? 'NULL' : newApartment.w!.offline_image!.isEmpty ? "''" : "'${newApartment.w?.offline_image!.map((i) => i.path).join(',')}'"},
                            '''}
                           $year, $month, ${regCode.isEmpty ? "''" : regCode}
                          ) 
          ''');
        return id1;
      });
    }

    print(apartments);
  }
}
