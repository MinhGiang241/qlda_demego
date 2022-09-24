import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constant/constants.dart';
import '../../../widgets/primary_card.dart';

const data = [
  {
    "Loại đơn": "Đơn xin nghỉ  giữa giờ",
    "Người tạo": "Nguyên Văn A",
    "Phòng ban": "Đơn xin nghỉ  giữa giờ",
    "Chức danh": "Nhân viên",
    "Ngày tạo": "06/08/2022 10:00",
    "Trạng thái": "Chờ tổ trưởng duyệt",
  },
  {
    "Loại đơn": "Đơn xin nghỉ  giữa giờ",
    "Người tạo": "Nguyên Văn A",
    "Phòng ban": "Đơn xin nghỉ  giữa giờ",
    "Chức danh": "Kỹ thuật",
    "Ngày tạo": "06/08/2022 10:00",
    "Trạng thái": "Đã duyệt",
  },
  {
    "Loại đơn": "Đơn xin nghỉ  giữa giờ",
    "Người tạo": "Nguyên Văn A",
    "Phòng ban": "Đơn xin nghỉ  giữa giờ",
    "Chức danh": "Nhân viên",
    "Ngày tạo": "06/08/2022 10:00",
    "Trạng thái": "Chờ tổ trưởng duyệt",
  },
];

class ApllicationCard extends StatelessWidget {
  const ApllicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: const BoxDecoration(color: backgroundColor),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(
                          color: shadowColor.withOpacity(0.1), width: 1),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: shadowColor.withOpacity(0.1),
                            offset: const Offset(0, 2))
                      ]),
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (ctx, j) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(children: [
                        hpad(24),
                        Expanded(
                            flex: 1,
                            child: Text('${data[i].keys.elementAt(j)} :',
                                style: txtBodySmallRegular(
                                    color: grayScaleColor2))),
                        Expanded(
                            flex: 1,
                            child: Text(data[i].values.elementAt(j),
                                style: txtBodySmallRegular(
                                    color: grayScaleColorBase))),
                        hpad(24),
                      ]),
                    ),
                  ));

              //   Flexible(
              //     child: Expanded(
              //       child: PrimaryCard(
              //         width: double.infinity,
              //         // ignore: unnecessary_cast
              //         child: Row(children: [
              //           Column(
              //               children: data[i]
              //                   .keys
              //                   .map(
              //                     (e) => Text('$e :'),
              //                   )
              //                   .toList()),
              //           Spacer(),
              //           Column(
              //               children: data[i]
              //                   .values
              //                   .map(
              //                     (e) => Text(e),
              //                   )
              //                   .toList()),
              //         ]),
              //       ),
              //     ),
              //   );
              // }),
            }),
      ),
    );

    // const PrimaryCard(
    //   width: double.infinity,
    //   child: Text('hello'),
    // );
  }
}
