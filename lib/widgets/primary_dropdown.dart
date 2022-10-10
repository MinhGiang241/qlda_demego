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
  PrimaryDropDown({
    super.key,
    this.label,
    this.isRequired = false,
    this.value,
    this.onChange,
    this.selectList,
  });
  final String? label;
  final bool isRequired;
  String? value;
  Function(dynamic)? onChange;
  final List<DropdownMenuItem>? selectList;

  @override
  State<PrimaryDropDown> createState() => _PrimaryDropDownState();
}

class _PrimaryDropDownState extends State<PrimaryDropDown> {
  int indexSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label!,
              style: txtBodySmallRegular(color: grayScaleColorBase),
            ),
            if (widget.isRequired) hpad(4),
            if (widget.isRequired)
              Text("*", style: txtBodySmallRegular(color: redColorBase))
          ],
        ),
        if (widget.label != null) vpad(8),
        DropdownButtonFormField<dynamic>(
          value: widget.value,
          isExpanded: true,
          // value: items[indexSelected],
          // dropdownColor: Colors.black,
          hint: Text(
            "--${S.of(context).select}--",
            overflow: TextOverflow.ellipsis,
          ),
          style: txtBodySmallBold(color: grayScaleColorBase),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: txtBodySmallBold(color: grayScaleColor3),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor2, width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: widget.onChange ??
              (v) {
                if (widget.value != null) {
                  widget.value = v.toString();
                }
              },
          items: widget.selectList ?? items,
        )
      ],
    );
  }
}
