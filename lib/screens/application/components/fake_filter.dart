import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';

void filterApplication(context) {
  FocusScope.of(context).unfocus();
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      context: context,
      builder: ((context) {
        return Container(
          height: 450,
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                  const Spacer(),
                  Text(S.of(context).filter, style: txtBold(16)),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.check, color: secondaryColorBase),
                  ),
                ],
              ),
              vpad(32),
              Container(
                  width: double.infinity,
                  child: Text("Loại đơn từ", style: txtBold(14))),
              vpad(16),
              Row(
                children: [
                  SizedBox(
                    width: 22.0,
                    height: 22.0,
                    child: Checkbox(
                        value: true,
                        activeColor: secondaryColorBase,
                        onChanged: (_) {}),
                  ),
                  hpad(18),
                  AutoSizeText(
                    "Tất cả",
                    maxLines: 2,
                    minFontSize: 1,
                    style: txtBodySmallRegular(color: grayScaleColorBase),
                  ),
                ],
              ),
              vpad(15),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Flex(direction: Axis.horizontal, children: [
                      SizedBox(
                        width: 22.0,
                        height: 22.0,
                        child: Checkbox(
                            value: true,
                            activeColor: secondaryColorBase,
                            onChanged: (_) {}),
                      ),
                      hpad(18),
                      AutoSizeText(
                        "Đơn nghỉ phép",
                        maxLines: 2,
                        minFontSize: 1,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Flex(direction: Axis.horizontal, children: [
                      SizedBox(
                        width: 22.0,
                        height: 22.0,
                        child: Checkbox(
                            value: true,
                            activeColor: secondaryColorBase,
                            onChanged: (_) {}),
                      ),
                      hpad(18),
                      AutoSizeText(
                        "Đơn nghỉ giữa giờ",
                        maxLines: 1,
                        minFontSize: 1,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      ),
                    ]),
                  ),
                ],
              ),
              vpad(15),
              Row(
                children: [
                  SizedBox(
                    width: 22.0,
                    height: 22.0,
                    child: Checkbox(
                        value: true,
                        activeColor: secondaryColorBase,
                        onChanged: (_) {}),
                  ),
                  hpad(18),
                  AutoSizeText(
                    "Đơn đổi ca",
                    maxLines: 2,
                    minFontSize: 1,
                    style: txtBodySmallRegular(color: grayScaleColorBase),
                  ),
                ],
              ),
              vpad(15),
              Container(
                  width: double.infinity,
                  child: Text("Trạng thái", style: txtBold(14))),
              vpad(15),
              Row(
                children: [
                  SizedBox(
                    width: 22.0,
                    height: 22.0,
                    child: Checkbox(
                        value: true,
                        activeColor: secondaryColorBase,
                        onChanged: (_) {}),
                  ),
                  hpad(18),
                  AutoSizeText(
                    "Tất cả",
                    maxLines: 2,
                    minFontSize: 1,
                    style: txtBodySmallRegular(color: grayScaleColorBase),
                  ),
                ],
              ),
              vpad(15),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Flex(direction: Axis.horizontal, children: [
                      SizedBox(
                        width: 22.0,
                        height: 22.0,
                        child: Checkbox(
                            value: true,
                            activeColor: secondaryColorBase,
                            onChanged: (_) {}),
                      ),
                      hpad(18),
                      AutoSizeText(
                        "Đã duyệt",
                        maxLines: 2,
                        minFontSize: 1,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      ),
                      Text(
                        "",
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      )
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Flex(direction: Axis.horizontal, children: [
                      SizedBox(
                        width: 22.0,
                        height: 22.0,
                        child: Checkbox(
                            value: true,
                            activeColor: secondaryColorBase,
                            onChanged: (_) {}),
                      ),
                      hpad(18),
                      AutoSizeText(
                        "Từ chối",
                        maxLines: 2,
                        minFontSize: 1,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      ),
                    ]),
                  ),
                ],
              ),
              vpad(15),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Flex(direction: Axis.horizontal, children: [
                      SizedBox(
                        width: 22.0,
                        height: 22.0,
                        child: Checkbox(
                            value: true,
                            activeColor: secondaryColorBase,
                            onChanged: (_) {}),
                      ),
                      hpad(18),
                      AutoSizeText(
                        "Chờ trưởng ca duyệt",
                        maxLines: 2,
                        minFontSize: 1,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Flex(direction: Axis.horizontal, children: [
                      SizedBox(
                        width: 22.0,
                        height: 22.0,
                        child: Checkbox(
                            value: true,
                            activeColor: secondaryColorBase,
                            onChanged: (_) {}),
                      ),
                      hpad(18),
                      AutoSizeText(
                        "Chờ trưởng ca duyệt",
                        maxLines: 2,
                        minFontSize: 1,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      ),
                    ]),
                  ),
                ],
              ),
              vpad(15),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Flex(direction: Axis.horizontal, children: [
                      SizedBox(
                        width: 22.0,
                        height: 22.0,
                        child: Checkbox(
                            value: true,
                            activeColor: secondaryColorBase,
                            onChanged: (_) {}),
                      ),
                      hpad(18),
                      AutoSizeText(
                        "Chờ xác nhận",
                        maxLines: 2,
                        minFontSize: 1,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Flex(direction: Axis.horizontal, children: [
                      SizedBox(
                        width: 22.0,
                        height: 22.0,
                        child: Checkbox(
                            value: true,
                            activeColor: secondaryColorBase,
                            onChanged: (_) {}),
                      ),
                      hpad(18),
                      AutoSizeText(
                        "Chưa duyệt",
                        maxLines: 2,
                        minFontSize: 1,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      ),
                    ]),
                  ),
                ],
              ),
              vpad(50)
            ],
          ),
        );
      }));
}
