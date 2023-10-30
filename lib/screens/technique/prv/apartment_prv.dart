// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

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
}
