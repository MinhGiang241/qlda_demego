import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:qlda_demego/models/asset_model.dart';
import 'package:qlda_demego/models/file_upload_model.dart';
import 'package:qlda_demego/services/api/api_indicator.dart';
import 'package:qlda_demego/widgets/select_media_widget.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../models/apartment.dart';
import '../../../utils/utils.dart';
import '../../../widgets/choose_month_year.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_text_field.dart';

class ElectricPrv extends ChangeNotifier {
  ElectricPrv() {
    dateController.text = '$month/$year';
  }
  TextEditingController dateController = TextEditingController();
  DateTime? date;
  TextEditingController startController = TextEditingController();
  TextEditingController endContrroller = TextEditingController();
  List<File> listImages = [];
  List<FileUploadModel> existedImages = [];
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  List<Apartment> apartments = [];
  final formatter = NumberFormat('#,###,###');
  String? startValidate;
  String? endValidate;

  Future getApartments(BuildContext context) async {
    await APIIndicator.getApartmentIndicator(year, month).then((v) {
      if (v != null) {
        apartments.clear();
        for (var i in v) {
          apartments.add(Apartment.fromJson(i));
        }
      }
    }).catchError((e) {
      Utils.showErrorMessage(context, e);
    });
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

  tabRow(BuildContext context, Apartment e) {
    startController.text = formatter.format(e.e?.electricity_head ?? 0);
    endContrroller.text = formatter.format(e.e?.electricity_last ?? 0);
    var cons = (e.e?.electricity_last ?? 0) - (e.e?.electricity_head ?? 0);
    bool loading = false;
    final formKey = GlobalKey<FormState>();
    Utils.showDialog(
      context: context,
      dialog: PrimaryDialog.custom(
        content: StatefulBuilder(
          builder: (context, setState) {
            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              onChanged: () {},
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
                    children: [
                      Expanded(
                        child: PrimaryTextField(
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
                                  double.tryParse(endContrroller.text) != null
                                      ? double.parse(endContrroller.text)
                                      : 0;
                              cons = end - start;
                            });
                          },
                        ),
                      ),
                      hpad(10),
                      Expanded(
                        child: PrimaryTextField(
                          validateString: endValidate,
                          controller: endContrroller,
                          label: 'Chỉ số cuối',
                          onlyNum: true,
                          onChanged: (v) {
                            setState(() {
                              endContrroller.text = v.trim();
                              double start =
                                  double.tryParse(startController.text) != null
                                      ? double.parse(startController.text)
                                      : 0;
                              double end =
                                  double.tryParse(endContrroller.text) != null
                                      ? double.parse(endContrroller.text)
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
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            await Future.delayed(const Duration(seconds: 2))
                                .then((v) {
                              setState(() {
                                loading = false;
                              });
                              Navigator.pop(context);
                            });
                          },
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
