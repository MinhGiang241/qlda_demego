// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/models/indicator.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../models/apartment.dart';
import '../../../models/file_upload_model.dart';
import '../../../models/indicator_data.dart';
import '../../../services/api/api_file.dart';
import '../../../services/api/api_indicator.dart';
import '../../../services/api/api_services.dart';
import '../../../services/api/prf_data.dart';
import '../../../utils/sqlflite.dart';
import '../../../utils/utils.dart';
import '../../../widgets/choose_month_year.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/select_media_widget.dart';
import '../water_screen.dart';
import 'apartment_prv.dart';

class WaterPrv extends ChangeNotifier {
  WaterPrv({
    this.text = '',
    required this.context,
  }) {
    year = DateTime.now().year;
    month = DateTime.now().month;
    dateController.text = '$month/$year';
    searchController.text = text;
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
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  List<Apartment> apartmentSearch = [];
  List<Apartment> apartmentView = [];
  final formatter = NumberFormat('#,###,###');
  String? startValidate;
  String? endValidate;
  bool loading = false;
  bool initLoading = false;
  final formKey = GlobalKey<FormState>();
  int count = 0;
  int total = 0;
  int latch = 0;
  int skip = 0;
  int limit = 40;

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
        .read<ApartmentPrv>()
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

  pickDate(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
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
    } else {
      Utils.showErrorMessage(
        context,
        "Không lấy dược chỉ số của tháng khác khi offline",
      );
    }
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
    // if (startController.text.trim().isEmpty) {
    //   startValidate = S.current.not_empty;
    // }
    //  else if (geater()) {
    //   startValidate = null;
    // }
    // else {
    //   startValidate = null;
    // }
    if (endController.text.trim().isEmpty) {
      endValidate = S.current.not_empty;
    }
    // else if (geater()) {
    //   endValidate = S.current.start_greater_end;
    // }
    else {
      endValidate = null;
    }
  }

  String? validateTextField(String? v) {
    if (v!.trim().isEmpty) {
      return '';
    }
    // else if (geater()) {
    //   return '';
    // }

    return null;
  }

  validateForm(BuildContext context, setState) {
    if (formKey.currentState!.validate()) {
      validate();
    } else {
      validate();
    }
    setState(() {});
  }

  onSubmit(
    setState,
    BuildContext context,
    Apartment e,
  ) async {
    if (listImages.isEmpty && existedImages.isEmpty) {
      Utils.showErrorMessage(context, "Hình ảnh không được để trống");
    } else if (endController.text.isEmpty) {
      Utils.showErrorMessage(context, "Chỉ số cuối không được để trống");
    } else if (formKey.currentState!.validate()) {
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
        var consumption = (endController.text.trim().isEmpty ||
                startController.text.trim().isEmpty)
            ? null
            : double.parse(endController.text.trim()) -
                double.parse(startController.text.trim());
        var indi = WaterIndicator(
          image: existedImages + uploadedImages,
          id: e.w?.id,
          apartmentId: e.id,
          water_head: double.tryParse(startController.text.trim()) != null
              ? double.parse(startController.text.trim())
              : null,
          water_last: double.tryParse(endController.text.trim()) != null
              ? double.parse(endController.text.trim())
              : null,
          water_consumption: consumption,
          latch: false,
          month: month,
          year: year,
          offline_image: offlineImage,
        );

        // /connectivityResult == ConnectivityResult.
        if (connectivityResult == ConnectivityResult.none) {
          await SqlfliteServices.shared.openSQLDatabase();
          setState(() {
            loading = false;
          });
          var apartmentCopy = e.copyWith();
          apartmentCopy.w = indi;

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
                      listImages.clear();
                      existedImages.clear();
                      uploadedImages.clear();
                      try {
                        await SqlfliteServices.shared.saveApartment(
                          apartmentCopy,
                          month,
                          year,
                          ApiService.shared.regCode,
                          false,
                        );
                        indi.isLocal = true;
                        e.w = indi;

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
          await APIIndicator.saveIndicator(false, indi.toMap()).then((v) {
            setState(() {
              loading = false;
            });
            Utils.showSuccessMessage(
              context: context,
              e: "Nhập chỉ số nước thành công căn ${e.code}",
              onClose: () {
                listImages.clear();
                existedImages.clear();
                uploadedImages.clear();
                Navigator.pushReplacementNamed(
                  context,
                  WaterScreen.routeName,
                  arguments: {
                    "year": year,
                    'month': month,
                    "search": searchController.text.trim(),
                  },
                );
              },
            );
            e.w = indi;
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

  tabRow(BuildContext context, Apartment e) {
    startController.text =
        e.lw?.water_last == null ? '' : formatter.format(e.lw?.water_last ?? 0);
    endController.text =
        e.w?.water_last == null ? '' : formatter.format(e.w?.water_last ?? 0);
    var cons = (e.w?.water_last == null || e.lw?.water_last == null)
        ? null
        : (e.w?.water_last ?? 0) - (e.lw?.water_last ?? 0);
    existedImages = [...(e.w?.image ?? [])];
    listImages.clear();
    if (e.w?.offline_image != null && e.w!.offline_image!.isNotEmpty) {
      listImages = listImages + e.w!.offline_image!;
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
                          'Mã ${e.water_code}',
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
                              if (startController.text.trim().isNotEmpty &&
                                  endController.text.trim().isNotEmpty) {
                                cons = end - start;
                              }
                            });
                          },
                        ),
                      ),
                      hpad(10),
                      Expanded(
                        child: PrimaryTextField(
                          keyboardType: TextInputType.number,
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

                              if (startController.text.trim().isNotEmpty &&
                                  endController.text.trim().isNotEmpty) {
                                cons = end - start;
                              }
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
                          text: cons == null ? '' : formatter.format(cons),
                          style: txtBold(16, Colors.black),
                        ),
                      ],
                    ),
                  ),
                  vpad(12),
                  SelectMediaWidget(
                    existImages: existedImages,
                    images: listImages,
                    title: S.of(context).add_photo,
                    onRemoveExist: (int index) {
                      setState(() {
                        existedImages.removeAt(index);
                      });
                    },
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
                            listImages.clear();
                            existedImages.clear();
                            uploadedImages.clear();
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
