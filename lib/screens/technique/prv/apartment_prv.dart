// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import '../../../models/apartment.dart';

class ApartmentPrv extends ChangeNotifier {
  ApartmentPrv({
    required this.context,
  });
  BuildContext context;
  List<Apartment> apartments = [];

  clearApartment() {
    apartments.clear();
    notifyListeners();
  }

  addApartment(Apartment apartment) {
    apartments.add(apartment);
    notifyListeners();
  }

  deleteLocalIndicator(bool isElectric, String id) {
    var index = apartments.indexWhere((apartment) => apartment.id == id);
    if (index >= 0) {
      if (isElectric) {
        apartments[index].e = null;
      } else {
        apartments[index].w = null;
      }
    }
    notifyListeners();
  }
}
