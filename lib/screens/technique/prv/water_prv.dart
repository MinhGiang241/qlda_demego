// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
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
import '../../../utils/utils.dart';
import '../../../widgets/choose_month_year.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/select_media_widget.dart';
import '../water_screen.dart';

class WaterPrv extends ChangeNotifier {
  WaterPrv({
    required this.year,
    required this.month,
    required this.text,
  }) {
    dateController.text = '$month/$year';
    searchController.text = text;
  }
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
  List<Apartment> apartments = [];
  final formatter = NumberFormat('#,###,###');
  String? startValidate;
  String? endValidate;
  bool loading = false;
  bool initLoading = false;
  final formKey = GlobalKey<FormState>();
  int count = 0;
  int total = 0;
  int skip = 0;
  int limit = 40;

  Future getApartments(BuildContext context, bool init) async {
    if (init) {
      initLoading = true;
      // notifyListeners();
    }
    if (init) {
      apartments.clear();
      skip = 0;
    } else {
      skip += limit;
    }
    var textSearch = searchController.text.trim();
    await APIIndicator.getApartmentIndicator(
      year,
      month,
      skip,
      limit,
      textSearch,
    ).then((v) {
      if (v != null) {
        for (var i in v) {
          apartments.add(Apartment.fromJson(i));
        }
      }
      return APIIndicator.getApartmentIndicatorCount(false, null, month, year);
    }).then((v) {
      if (init) {
        initLoading = false;
      }

      if (v != null) {
        count = v['count'];
        total = v['total'];
      }
    }).catchError((e) {
      if (init) {
        initLoading = false;
      }

      Utils.showErrorMessage(context, e);
    });
    notifyListeners();
  }

  pickDate(BuildContext context) async {
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
      startValidate = S.current.start_greater_end;
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
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          loading = true;
          validate();
        });
        //  indicator
        var connectivityResult = await (Connectivity().checkConnectivity());
        List<File> offlineImage = [];
        if (connectivityResult != ConnectivityResult.none) {
          await uploadImages(context);
        } else {
          offlineImage = listImages;
        }
        var consumption = double.parse(endController.text.trim()) -
            double.parse(startController.text.trim());
        var indi = WaterIndicator(
          image: existedImages + uploadedImages,
          id: e.e?.id,
          apartmentId: e.id,
          water_head: double.tryParse(startController.text.trim()) != null
              ? double.parse(startController.text.trim())
              : 0,
          water_last: double.tryParse(endController.text.trim()) != null
              ? double.parse(endController.text.trim())
              : 0,
          water_consumption: consumption,
          latch: true,
          month: month,
          year: year,
          offline_image: offlineImage,
        );

        // /connectivityResult == ConnectivityResult.
        if (connectivityResult == ConnectivityResult.none) {
          var data =
              await PrfData.shared.getIndicator(ApiService.shared.regCode);
          if (data != null) {
            var indicatorData = IndicatorData.fromJson(data);

            var index = (indicatorData.water ?? []).indexWhere(
              (el) =>
                  el.apartmentId == e.id &&
                  el.year == year &&
                  el.month == month,
            );
            if (index < 0) {
              indicatorData.water!.add(indi);
            } else {
              indicatorData.water![index] = indi;
            }

            await PrfData.shared
                .setIndicator(indicatorData.toJson(), ApiService.shared.regCode)
                .then((v) async {
              Utils.showSnackBar(
                context,
                "Kết nối internet hiện tại không có sẵn ,dữ liệu sẽ gửi lên sau",
              );
              setState(() {
                loading = false;
              });
              Navigator.pop(context);
            });
          } else {
            var indicatorData = IndicatorData(
              baseURL: ApiService.shared.baseUrl,
              regCode: ApiService.shared.regCode,
              access_token: ApiService.shared.access_token,
              water: [indi],
            );
            await PrfData.shared
                .setIndicator(indicatorData.toJson(), ApiService.shared.regCode)
                .then((v) async {
              Utils.showSnackBar(
                context,
                "Kết nối internet hiện tại không có sẵn ,dữ liệu sẽ gửi lên sau",
              );
            });
          }

          //  RunService Background
          final service = FlutterBackgroundService();

          service.startService();
        } else {
          await APIIndicator.saveIndicator(false, indi.toMap()).then((v) {
            setState(() {
              loading = false;
            });
            Utils.showSuccessMessage(
              context: context,
              e: "Chốt chỉ số nước thành công căn ${e.code}",
              onClose: () {
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
    startController.text = formatter.format(e.w?.water_head ?? 0);
    endController.text = formatter.format(e.w?.water_last ?? 0);
    var cons = (e.w?.water_last ?? 0) - (e.w?.water_head ?? 0);
    existedImages = [...(e.w?.image ?? [])];

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
                          text: 'Mức tiêu thụ dự tính:',
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
