import 'package:flutter/material.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';

var filters = [
  'Tất cả',
  "Phiếu đề xuất kho",
  'Phiếu đề xuất mua sắm tài sản',
  'Phiếu đề xuất sửa chữa/thay thế'
];

void filterLetter(context) {
  FocusScope.of(context).unfocus();
  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    context: context,
    builder: ((context) {
      return Container(
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
                const Spacer(),
                Text(S.of(context).filter, style: txtBold(16)),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.check,
                    color: secondaryColorBase,
                  ),
                ),
              ],
            ),
            vpad(32),
            Container(
              width: double.infinity,
              child: Text("Loại Phiếu", style: txtBold(14)),
            ),
            vpad(16),
            ...filters.map(
              (e) => Row(
                children: [
                  SizedBox(
                    height: 30.0,
                    width: 22.0,
                    child: Checkbox(
                      value: true,
                      activeColor: secondaryColorBase,
                      onChanged: (_) {},
                    ),
                  ),
                  hpad(18),
                  Text(
                    e,
                    maxLines: 2,
                    style: txtBodySmallRegular(color: grayScaleColorBase),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }),
  );
}
