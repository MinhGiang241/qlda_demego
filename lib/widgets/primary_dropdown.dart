import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:qlda_demego/widgets/primary_card.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../constant/constants.dart';
import '../generated/l10n.dart';

var data = [
  'Lựa chọn 1',
  'Lựa chọn 2',
  'Lựa chọn 3',
  'Lựa chọn 4',
  'Lựa chọn 5',
  'Lựa chọn 6',
  'Lựa chọn 7'
];

var items = data.asMap().entries.map((v) {
  return DropdownMenuItem(
    value: v.key,
    child: Text(v.value),
  );
}).toList();

class PrimaryDropDown extends StatefulWidget {
  const PrimaryDropDown(
      {super.key, this.label, this.isRequired = false, this.controller});
  final String? label;
  final bool isRequired;
  final TextEditingController? controller;

  @override
  State<PrimaryDropDown> createState() => _PrimaryDropDownState();
}

class _PrimaryDropDownState extends State<PrimaryDropDown> {
  int indexSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text(widget.label!,
              style: txtBodySmallRegular(color: grayScaleColorBase)),
          if (widget.isRequired) hpad(4),
          if (widget.isRequired)
            Text("*", style: txtBodySmallRegular(color: redColorBase))
        ],
      ),
      if (widget.label != null) vpad(8),
      DropdownButtonFormField(
        // value: items[indexSelected],
        // dropdownColor: Colors.black,
        hint: Text("---Chọn---"),
        style: txtBodySmallBold(color: grayScaleColorBase),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintStyle: txtBodySmallBold(color: grayScaleColor3),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor2, width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
        onChanged: (v) {
          indexSelected = v!;
        },
        items: items,
      )
      // PrimaryTextField(
      //   suffixIcon: DropdownButton(onChanged: (v) {}, items: []),
      // )
      // PrimaryCard(
      //     child: DropdownButton(
      //   onChanged: (v) {},
      //   items: [],
      // ))
    ]);
  }
}