import 'package:flutter/material.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';

void filterApplication(context) {
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
                      icon: const Icon(Icons.check)),
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
                  Text(
                    "Tất cả",
                    style: txtBodySmallRegular(color: grayScaleColorBase),
                  )
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
                      Text(
                        "Đơn nghỉ phép",
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
                      Text(
                        "Đơn nghỉ giữa giờ",
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      )
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
                  Text(
                    "Đơn đổi ca",
                    style: txtBodySmallRegular(color: grayScaleColorBase),
                  )
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
                  Text(
                    "Tất cả",
                    style: txtBodySmallRegular(color: grayScaleColorBase),
                  )
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
                      Text(
                        "Đã duyệt",
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
                      Text(
                        "Từ chối",
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      )
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
                      Text(
                        "Chờ trưởng ca duyệt",
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
                      Text(
                        "Chờ trưởng ca duyệt",
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      )
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
                      Text(
                        "Chờ xác nhận",
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
                      Text(
                        "Chưa duyệt",
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      )
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
