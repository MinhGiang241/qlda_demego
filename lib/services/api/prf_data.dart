import 'dart:convert';

import 'package:hive/hive.dart';

@HiveType(typeId: 1, adapterName: "listapartment")
class ListOwn extends HiveObject {
  ListOwn({this.own});
  @HiveField(0)
  String? own;
}

// class ListOwnAdapter extends TypeAdapter<ListOwn> {
//   @override
//   ListOwn read(BinaryReader reader) {
//     var numOfFields = reader.readByte();
//     var fields = <int, dynamic>{
//       for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ListOwn()..own = fields[0] as String;
//   }

//   @override
//   void write(BinaryWriter writer, ListOwn obj) {
//     writer.write(obj.own);
//   }

//   @override
//   // TODO: implement typeId
//   int get typeId => 1;
// }

class PrfData {
  static final PrfData shared = PrfData();

  final _userBox = Hive.box("USER");
  final _signIn = Hive.box('SIGNIN');
  final _settingBox = Hive.box("SETTINGS");

  static Future open() async {
    await Hive.openBox("USER");
    await Hive.openBox("SIGNIN");
    await Hive.openBox("SETTINGS");
  }

  final String _tokenKey = "token";
  final String _languageKey = "language";
  //FloorPlan
  final String _floorPlan = "floorPlan";
  final String _apartment = "apartment";
  final String _resident = "resident";
  final String _listApartment = "listapartment";

  Future<void> setToken(String token) async {
    return _userBox.put(_tokenKey, token);
  }

  Future<void> setSignInStore(String user, String password) async {
    await _signIn.put("acc", user);
    await _signIn.put("pass", password);
  }

  Future deleteSignInStore() async {
    await _signIn.deleteAll(["acc", "pass"]);
  }

  getSignInStore() async {
    var acc = await _signIn.get("acc");
    var pass = await _signIn.get("pass");

    return {"acc": acc, 'pass': pass};
  }

  Future<void> deteleSignInStore() async {
    return await _signIn.deleteAll(["acc", 'pass']);
  }

  String? getToken() {
    return _userBox.get(_tokenKey);
  }

  Future<void> deleteUser() async {
    return await _userBox.deleteAll([_tokenKey]);
  }

  Future<void> setLanguage(int lang) async {
    return _settingBox.put(_languageKey, lang);
  }

  int? getLanguage() {
    return _userBox.get(_languageKey);
  }
}
