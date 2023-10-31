// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/models/file_upload_model.dart';
import 'package:qlda_demego/models/indicator.dart';
import 'package:qlda_demego/models/indicator_data.dart';
import 'package:qlda_demego/screens/technique/prv/apartment_prv.dart';
import 'package:qlda_demego/services/api/api_file.dart';
import 'package:qlda_demego/services/api/api_indicator.dart';
import 'package:qlda_demego/services/api/api_services.dart';
import 'package:qlda_demego/services/api/prf_data.dart';
import 'package:qlda_demego/utils/sqlflite.dart';
import 'package:qlda_demego/widgets/select_media_widget.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../models/apartment.dart';
import '../../../utils/utils.dart';
import '../../../widgets/choose_month_year.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_text_field.dart';
import '../electric_screen.dart';
import '../technical_screen.dart';

class ElectricPrv extends ChangeNotifier {
  ElectricPrv({
    this.text = '',
    required this.context,
  }) {
    year = DateTime.now().year;
    month = DateTime.now().month;
    dateController.text = '$month/$year';
    searchController.text = text;
    SqlfliteServices.shared.openSQLDatabase();
    //apartments = context.read<ApartmentPrv>().apartments;
    getApartments(context, true);
  }
  BuildContext context;
  String text = '';
  TextEditingController dateController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  DateTime? date;
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  List<File> listImages = [];
  List<FileUploadModel> existedImages = [];
  List<FileUploadModel> uploadedImages = [];

  late int year = DateTime.now().year;
  late int month = DateTime.now().month;
  // List<Apartment> apartments = [];
  List<Apartment> apartmentView = [];
  List<Apartment> apartmentSearch = [];
  final formatter = NumberFormat('#,###,###');
  String? startValidate;
  String? endValidate;
  bool loading = false;
  bool initLoading = false;
  final formKey = GlobalKey<FormState>();
  int count = 0;
  int total = 0;
  int skip = 0;
  int latch = 0;
  int limit = 20;

  clearApartment(BuildContext context) {
    apartmentSearch.clear();
    apartmentView.clear();
    context.read<ApartmentPrv>().clearApartment();
    notifyListeners();
  }

  void onSearchText(BuildContext context) {
    FocusScope.of(context).unfocus();
    text = searchController.text.trim();
    initLoading = true;
    notifyListeners();

    apartmentView.clear();

    apartmentSearch = context
        .watch<ApartmentPrv>()
        .apartments
        .where(
          (element) => RegExp(
            text,
            caseSensitive: false,
            multiLine: false,
          ).hasMatch(element.code ?? ''),
        )
        .toList();
    if (limit < apartmentSearch.length) {
      apartmentView = apartmentSearch.sublist(0, limit);
    } else {
      apartmentView = apartmentSearch;
    }

    initLoading = false;
    notifyListeners();
  }

  Future getApartments(BuildContext context, bool init) async {
    try {
      if (init) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          Utils.showDialog(
            context: context,
            dialog: PrimaryDialog.custom(
              title: "Không có kết nối",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Không có kết nối internet, Dữ liệu nhập vào sẽ lưu vào bộ nhớ máy.",
                    textAlign: TextAlign.center,
                  ),
                  vpad(20),
                  PrimaryButton(
                    buttonSize: ButtonSize.medium,
                    text: S.of(context).close,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
          return;
        }

        skip = 0;
        initLoading = true;
        notifyListeners();
        var textSearch = searchController.text.trim();
        var v = await APIIndicator.getApartmentIndicator(
          year,
          month,
          skip,
          limit,
          "",
        );
        if (v != null) {
          clearApartment(context);
          for (var i in v) {
            if (init) {
              var apart = Apartment.fromJson(i);
              context.read<ApartmentPrv>().addApartment(apart);
              if (RegExp(
                textSearch,
                caseSensitive: false,
                multiLine: false,
              ).hasMatch(apart.code ?? '')) {
                apartmentSearch.add(apart);
              }
            }
          }
          if (limit <= apartmentSearch.length) {
            apartmentView = apartmentSearch.sublist(0, limit);
          } else {
            apartmentView = apartmentSearch;
          }
          var v2 = await APIIndicator.getApartmentIndicatorCount(
            true,
            null,
            month,
            year,
          );
          count = v2['count'];
          total = v2['total'];
          latch = v2['latch'];
          initLoading = false;
          skip = limit;
          notifyListeners();
        }
      } else {
        if ((skip + limit) <= apartmentSearch.length) {
          var a = apartmentSearch.sublist(skip, skip + limit);
          apartmentView = apartmentView + a;

          skip += limit;
        } else if (skip <= apartmentSearch.length) {
          var b = apartmentSearch.sublist(skip);
          apartmentView = apartmentView + b;
          skip += limit;
        }
        notifyListeners();
      }
    } catch (e) {
      if (init) {
        initLoading = false;
        notifyListeners();
      }
      Utils.showErrorMessage(context, e.toString());
    }
  }

  pickDate(
    BuildContext context,
  ) async {
    await DatePicker.showPicker(
      context,
      onChanged: (v) {},
      onConfirm: (v) {
        year = v.year;
        month = v.month;
        dateController.text = '$month/$year';
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

  geater() {
    return ((double.tryParse(endController.text.trim()) != null
                    ? double.parse(endController.text.trim())
                    : 0) -
                (double.tryParse(startController.text.trim()) != null
                    ? double.parse(startController.text.trim())
                    : 0) <
            0) &&
        endController.text.trim().isNotEmpty &&
        startController.text.trim().isNotEmpty;
  }

  Future uploadImages(BuildContext context) async {
    await APIFile.uploadSingleFile(files: listImages, context: context)
        .then((v) {
      if (v.isNotEmpty) {
        for (var e in v) {
          uploadedImages.add(
            FileUploadModel(id: e.data, name: e.name),
          );
        }
      }
    }).catchError((e) {
      throw (e);
    });
  }

  validate() {
    if (startController.text.trim().isEmpty) {
      startValidate = S.current.not_empty;
    } else if (geater()) {
      startValidate = null;
    } else {
      startValidate = null;
    }
    if (endController.text.trim().isEmpty) {
      endValidate = S.current.not_empty;
    } else if (geater()) {
      endValidate = S.current.start_greater_end;
    } else {
      endValidate = null;
    }
  }

  String? validateTextField(String? v) {
    if (v!.trim().isEmpty) {
      return '';
    } else if (geater()) {
      return '';
    }

    return null;
  }

  onSubmit(
    setState,
    BuildContext context,
    Apartment e,
  ) async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          loading = true;
          validate();
        });
        var connectivityResult = await (Connectivity().checkConnectivity());
        List<File> offlineImage = [];
        if (connectivityResult != ConnectivityResult.none) {
          await uploadImages(context);
        } else {
          offlineImage = listImages.map((e) => File(e.path)).toList();
        }

        var consumption = double.parse(endController.text.trim()) -
            double.parse(startController.text.trim());
        var indi = ElectricIndicator(
          image: existedImages + uploadedImages,
          id: e.e?.id,
          apartmentId: e.id,
          electricity_head: double.tryParse(startController.text.trim()) != null
              ? double.parse(startController.text.trim())
              : 0,
          electricity_last: double.tryParse(endController.text.trim()) != null
              ? double.parse(endController.text.trim())
              : 0,
          electricity_consumption: consumption,
          latch: false,
          month: month,
          year: year,
          offline_image: offlineImage,
        );
        //  indicator

        // /connectivityResult == ConnectivityResult.
        if (connectivityResult == ConnectivityResult.none) {
          await SqlfliteServices.shared.openSQLDatabase();
          setState(() {
            loading = false;
          });
          var apartmentCopy = e.copyWith();
          apartmentCopy.e = indi;

          Utils.showDialog(
            context: context,
            dialog: PrimaryDialog.custom(
              title: "Không có kết nối",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Không có kết nối internet, Dữ liệu nhập vào sẽ lưu vào bộ nhớ máy.",
                    textAlign: TextAlign.center,
                  ),
                  vpad(20),
                  PrimaryButton(
                    buttonSize: ButtonSize.medium,
                    text: S.of(context).close,
                    onTap: () async {
                      Navigator.pop(context);
                      Navigator.pop(context);

                      try {
                        await SqlfliteServices.shared.saveApartment(
                          apartmentCopy,
                          month,
                          year,
                          ApiService.shared.regCode,
                          true,
                        );
                        indi.isLocal = true;
                        e.e = indi;
                        print(e);
                        notifyListeners();
                      } catch (e) {
                        Utils.showErrorMessage(context, e.toString());
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          await APIIndicator.saveIndicator(true, indi.toMap()).then((v) {
            setState(() {
              loading = false;
            });
            Utils.showSuccessMessage(
              context: context,
              e: "Nhập chỉ số điện thành công căn ${e.code}",
              onClose: () {
                Navigator.pushReplacementNamed(
                  context,
                  ElectricScreen.routeName,
                  arguments: {
                    "year": year,
                    'month': month,
                    'search': searchController.text.trim(),
                  },
                );
              },
            );
            e.e = indi;
            notifyListeners();
          });
        }
      } catch (e) {
        setState(() {
          loading = false;
        });
        Utils.showErrorMessage(context, e.toString());
      }
    } else {
      setState(() {
        loading = false;
        validate();
      });
    }
  }

  validateForm(BuildContext context, setState) {
    if (formKey.currentState!.validate()) {
      validate();
    } else {
      validate();
    }
    setState(() {});
  }

  tabRow(BuildContext context, Apartment e) {
    startController.text = formatter.format(e.le?.electricity_last ?? 0);
    endController.text = e.e?.electricity_last == null
        ? ''
        : formatter.format(e.e?.electricity_last ?? 0);
    var cons = (e.e?.electricity_last ?? 0) - (e.le?.electricity_last ?? 0);
    existedImages = [...(e.e?.image ?? [])];
    listImages.clear();
    if (e.e?.offline_image != null && e.e!.offline_image!.isNotEmpty) {
      listImages = listImages + e.e!.offline_image!;
    }
    print(listImages);

    Utils.showDialog(
      context: context,
      dialog: PrimaryDialog.custom(
        content: StatefulBuilder(
          builder: (context, setState) {
            setState(() {
              validate();
            });
            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              onChanged: () => validateForm(context, setState),
              child: Column(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: PrimaryTextField(
                          validator: validateTextField,
                          validateString: startValidate,
                          onlyNum: true,
                          enable: false,
                          controller: startController,
                          label: 'Chỉ số đầu',
                          onChanged: (v) {
                            setState(() {
                              startController.text = v.trim();
                              double start =
                                  double.tryParse(startController.text) != null
                                      ? double.parse(startController.text)
                                      : 0;
                              double end =
                                  double.tryParse(endController.text) != null
                                      ? double.parse(endController.text)
                                      : 0;
                              cons = end - start;
                            });
                          },
                        ),
                      ),
                      hpad(10),
                      Expanded(
                        child: PrimaryTextField(
                          validator: validateTextField,
                          validateString: endValidate,
                          controller: endController,
                          label: 'Chỉ số cuối',
                          onlyNum: true,
                          onChanged: (v) {
                            setState(() {
                              endController.text = v.trim();
                              double start =
                                  double.tryParse(startController.text) != null
                                      ? double.parse(startController.text)
                                      : 0;
                              double end =
                                  double.tryParse(endController.text) != null
                                      ? double.parse(endController.text)
                                      : 0;
                              cons = end - start;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  vpad(12),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Mức tiêu thụ dự tính: ',
                          style: txtRegular(16, Colors.black),
                        ),
                        TextSpan(
                          text: formatter.format(cons),
                          style: txtBold(16, Colors.black),
                        ),
                      ],
                    ),
                  ),
                  vpad(12),
                  SelectMediaWidget(
                    existImages: existedImages,
                    onRemoveExist: (int index) {
                      setState(() {
                        existedImages.removeAt(index);
                      });
                    },
                    images: listImages,
                    title: S.of(context).add_photo,
                    onRemove: (int index) {
                      setState(() {
                        listImages.removeAt(index);
                      });
                    },
                    onSelect: () {
                      Utils.selectImage(context, false).then((v) {
                        if (v != null) {
                          final list =
                              v.map<File>((e) => File(e.path)).toList();
                          listImages.addAll(list);
                          setState(() {});
                        }
                      });
                    },
                  ),
                  vpad(18),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          text: S.of(context).cancel,
                          buttonType: ButtonType.red,
                          buttonSize: ButtonSize.medium,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      hpad(10),
                      Expanded(
                        child: PrimaryButton(
                          isLoading: loading,
                          text: S.of(context).save,
                          buttonSize: ButtonSize.medium,
                          onTap: () => onSubmit(setState, context, e),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
