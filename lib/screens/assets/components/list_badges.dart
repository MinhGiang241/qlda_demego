import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/primary_card.dart';

class ListBadges extends StatelessWidget {
  const ListBadges({
    super.key,
    required this.badges,
    this.assignee,
    this.dateAssign,
    this.amount,
  });

  final List<dynamic> badges;
  final String? assignee;
  final int? amount;
  final DateTime? dateAssign;

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      width: double.infinity,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // scrollDirection: Axis.horizontal,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (assignee != null) vpad(6),
                  if (assignee != null)
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 14),
                          width: dvWidth(context) - 140,
                          child: Text(
                            "${S.of(context).assign} - ${assignee!}",
                            style: txtBodySmallBold(),
                          ),
                        ),
                        if (amount != null)
                          Container(
                            child: Text(
                              '${S.of(context).amount}: ${amount.toString()}',
                              textAlign: TextAlign.start,
                              style: txtBodySmallBold(),
                            ),
                          ),
                      ],
                    ),
                  if (assignee != null) vpad(12),
                  Row(
                    children: [
                      ...badges.map(
                        (e) => Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 80,
                                  height: 32,
                                  child: Text(
                                    e['text'] as String,
                                    textAlign: TextAlign.center,
                                    style: txtBodySmallBold(),
                                  ),
                                ),
                                vpad(6),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: e['color'] as Color,
                                  ),
                                  height: 26,
                                  width: 60,
                                  child: Text(
                                    e['number'].toString(),
                                    textAlign: TextAlign.center,
                                    style: txtBodyMediumBold(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (dateAssign != null) vpad(12),
                  if (dateAssign != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        dateAssign!.toIso8601String().formatDateTimeHmDMY(),
                        textAlign: TextAlign.right,
                        style: txtBodySmallBold(),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
