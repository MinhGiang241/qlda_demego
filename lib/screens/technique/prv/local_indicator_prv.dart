// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/models/file_upload_model.dart';
import 'package:qlda_demego/models/indicator.dart';
import 'package:qlda_demego/screens/technique/prv/electric_prv.dart';
import 'package:qlda_demego/services/api/api_file.dart';
import 'package:qlda_demego/services/api/api_indicator.dart';
import 'package:qlda_demego/services/api/api_services.dart';
import 'package:qlda_demego/utils/sqlflite.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../models/apartment.dart';
import '../../../utils/utils.dart';
import '../../../widgets/choose_month_year.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_text_field.dart';
import '../../../widgets/select_media_widget.dart';
import 'apartment_prv.dart';

class LocalIndicatorPrv extends ChangeNotifier {
  LocalIndicatorPrv() {
    dateController.text = '$month/$year';
    SqlfliteServices.shared.openSQLDatabase().then((_) {
      getAllApartmentFromLocal(true);
    });
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController searchConttroller = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  List<File> listImages = [];
  final formatter = NumberFormat('#,###,###');
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  List<ApartmentFromSQL> electricApartments = [];
  List<ApartmentFromSQL> waterApartments = [];
  int limit = 40;
  int skip = 0;
  bool loading = false;

  clearData() {
    skip = 0;
    electricApartments.clear();
    electricApartments.clear();
    searchConttroller.clear();
    notifyListeners();
  }

  Future sendDataToServer(BuildContext context, bool isElectric) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Utils.showDialog(
          context: context,
          dialog: PrimaryDialog.custom(
            title: "Không có kết nối ",
            content: Column(children: [
              const Text("Bạn Không thể gửi dữ liệu !"),
              vpad(20),
              PrimaryButton(
                text: S.of(context).close,
                buttonSize: ButtonSize.medium,
                onTap: () {
                  Navigator.of(context).pop(context);
                },
              )
            ]),
          ));

      return;
    }
    loading = true;
    notifyListeners();

    try {
      var dataSql =
          await SqlfliteServices.shared.findAllIndicatorWithCodeAndMonth(
        year,
        month,
        ApiService.shared.regCode,
      );
      List<ApartmentFromSQL> dataAparment = [];
      var length = dataSql.length;
      print(length);

      for (var i in dataSql) {
        var apartment = ApartmentFromSQL.fromMap(i);
        print(apartment);

        if (isElectric &&
            apartment.offline_images_e != null &&
            apartment.offline_images_e!.isNotEmpty) {
          var fileList = apartment.offline_images_e!
              .split(',')
              .map((e) => File(e))
              .toList();

          var uploadedList = await APIFile.uploadSingleFile(files: fileList);

          apartment.uploaded_images_e = uploadedList
              .map((f) => FileUploadModel(id: f.data, name: f.name))
              .toList();
        } else if (!isElectric &&
            apartment.offline_images_w != null &&
            apartment.offline_images_w!.isNotEmpty) {
          var fileList = apartment.offline_images_w!
              .split(',')
              .map((e) => File(e))
              .toList();

          var uploadedList = await APIFile.uploadSingleFile(files: fileList);
          print(uploadedList);
          apartment.uploaded_images_w = uploadedList
              .map((f) => FileUploadModel(id: f.data, name: f.name))
              .toList();
        }

        if (isElectric &&
            apartment.electric_last != null &&
            apartment.electric_head != null) {
          dataAparment.add(apartment);
        }

        if (!isElectric &&
            apartment.water_last != null &&
            apartment.water_head != null) {
          dataAparment.add(apartment);
        }
      }
      if (dataAparment.isEmpty) {
        throw ("Không có dữ liệu ${isElectric ? "Chỉ số điện" : "Chỉ số nước"}");
      }
      List<Map<String, dynamic>> listSend = [];

      if (isElectric) {
        listSend = dataAparment
            .map(
              (e) => ElectricIndicator(
                apartmentId: e.id,
                image: e.uploaded_images_e,
                year: year,
                month: month,
                electricity_head: (e.electric_head ?? 0).toDouble(),
                electricity_last: (e.electric_last ?? 0).toDouble(),
              ).toMap(),
            )
            .toList();
      } else {
        listSend = dataAparment
            .map(
              (e) => WaterIndicator(
                apartmentId: e.id,
                image: e.uploaded_images_w,
                year: year,
                month: month,
                water_head: (e.water_head ?? 0).toDouble(),
                water_last: (e.water_last ?? 0).toDouble(),
              ).toMap(),
            )
            .toList();
      }

      await APIIndicator.saveManyIndicator(
        isElectric ? listSend : [],
        !isElectric ? listSend : [],
      ).then((v) {
        Utils.showSuccessMessage(
          context: context,
          e: "Gửi dữ liệu thành  công",
        );
      });
      var dataIds = dataAparment.map((e) => "'${e.id}'").join(',');

      await SqlfliteServices.shared.deleteDataWhenFinishSend(
        dataIds,
        year,
        month,
        ApiService.shared.regCode,
        isElectric,
      );
      await getAllApartmentFromLocal(true);
    } catch (e) {
      Utils.showErrorMessage(context, e.toString());
    }

    loading = false;
    notifyListeners();
  }

  Future deleteOneDataSQL(
    BuildContext context,
    bool isElectric,
    String id,
  ) async {
    loading = true;
    notifyListeners();
    try {
      var dataIds = '"$id"';
      await SqlfliteServices.shared.deleteDataWhenFinishSend(
        dataIds,
        year,
        month,
        ApiService.shared.regCode,
        isElectric,
      );
      await getAllApartmentFromLocal(true);
    } catch (e) {
      Utils.showErrorMessage(context, e.toString());
    }
    //await context.read<ElectricPrv>().getApartments(context, true);
    context.read<ApartmentPrv>().deleteLocalIndicator(isElectric, id);
    loading = false;
    notifyListeners();
  }

  Future getAllApartmentFromLocal(bool init) async {
    if (init) {
      skip = 0;
      electricApartments.clear();
      waterApartments.clear();
    } else {
      skip += limit;
    }
    await SqlfliteServices.shared
        .findAllIndicatorWithCodeAndMonthWithFilter(
      year,
      month,
      limit,
      skip,
      ApiService.shared.regCode,
      searchConttroller.text.trim(),
    )
        .then((v) {
      if (v != null) {
        for (var i in v) {
          var a = ApartmentFromSQL.fromMap(i);
          if (a.electric_last != null) {
            electricApartments.add(a);
          }
          if (a.water_last != null) {
            waterApartments.add(a);
          }
        }
      }
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  pickDate(BuildContext context) async {
    await DatePicker.showPicker(
      context,
      onChanged: (v) {},
      onConfirm: (v) {
        year = v.year;
        month = v.month;
        dateController.text = '$month/$year';
        getAllApartmentFromLocal(true);
      },
      pickerModel: CustomMonthPicker(
        minTime: DateTime(DateTime.now().year - 40, 1, 1),
        maxTime: DateTime(DateTime.now().year, 12, 31),
        currentTime: DateTime(
          year,
          month,
          1,
        ),
        custom: [1, 1, 0],
        locale: LocaleType.vi,
      ),
    );
  }

  tapRow(BuildContext context, ApartmentFromSQL e, bool isElectric) {
    startController.text = isElectric
        ? formatter.format(e.electric_head)
        : formatter.format(e.water_head);
    endController.text = isElectric
        ? formatter.format(e.electric_last)
        : formatter.format(e.water_last);
    Utils.showDialog(
      context: context,
      dialog: PrimaryDialog.custom(
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Căn ${e.code}',
                    style: txtRegular(12),
                  ),
                ),
                hpad(5),
                Expanded(
                  child: Text(
                    'Mã ${e.electrical_code}',
                    style: txtRegular(12),
                  ),
                ),
              ],
            ),
            vpad(5),
            const Divider(),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    controller: startController,
                    label: 'Chỉ số đầu',
                    onlyNum: true,
                    enable: false,
                  ),
                ),
                hpad(10),
                Expanded(
                  child: PrimaryTextField(
                    controller: endController,
                    label: 'Chỉ số đầu',
                    onlyNum: true,
                    enable: false,
                  ),
                ),
              ],
            ),
            vpad(12),
            SelectMediaWidget(
              enable: false,
              images: isElectric
                  ? (e.offline_images_e != null
                      ? e.offline_images_e!
                          .split(',')
                          .map((i) => File(i))
                          .toList()
                      : [])
                  : (e.offline_images_w != null
                      ? e.offline_images_w!
                          .split(',')
                          .map((i) => File(i))
                          .toList()
                      : []),
            ),
            vpad(18),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: S.of(context).close,
                    buttonSize: ButtonSize.medium,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                hpad(10),
                Expanded(
                  child: PrimaryButton(
                    text: S.of(context).delete,
                    buttonType: ButtonType.red,
                    buttonSize: ButtonSize.medium,
                    onTap: () async {
                      Utils.showConfirmMessage(
                        context: context,
                        title: "Xóa dữ liệu",
                        content: "Bạn có chắc chắn muốn xóa dữ liệu",
                        onConfirm: () async {
                          await deleteOneDataSQL(context, isElectric, e.id!)
                              .then((v) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }).catchError((e) {
                            Utils.showErrorMessage(context, e);
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
