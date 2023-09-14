import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:qlda_demego/models/file_upload_model.dart';
import 'package:qlda_demego/widgets/select_media_widget.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
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
  TextEditingController startContrroller = TextEditingController();
  TextEditingController endContrroller = TextEditingController();
  List<File> listImages = [];
  List<FileUploadModel> existedImages = [];
  int year = DateTime.now().year;
  int month = DateTime.now().month;

  pickDate(BuildContext context) async {
    DatePicker.showPicker(
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

  tabRow(BuildContext context) {
    Utils.showDialog(
      context: context,
      dialog: PrimaryDialog.custom(
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Căn 12A08',
                        style: txtRegular(12),
                      ),
                    ),
                    hpad(5),
                    Expanded(
                      child: Text('Mã DH32452562', style: txtRegular(12)),
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
                        controller: startContrroller,
                        label: 'Chỉ số đầu',
                      ),
                    ),
                    hpad(10),
                    Expanded(
                      child: PrimaryTextField(
                        controller: endContrroller,
                        label: 'Chỉ số cuối',
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
                        text: "200",
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
                        final list = v.map<File>((e) => File(e.path)).toList();
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
                        text: S.of(context).save,
                        buttonSize: ButtonSize.medium,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
