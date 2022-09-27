import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/screens/application/break_time_letter.dart';
import 'package:qlda_demego/screens/application/change_shift_letter.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_icon.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/search_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_appbar.dart';
import './components/application_card.dart';
import 'absent_letter.dart';
import 'components/fake_filter.dart';
import 'detail_letter_screen.dart';

const data = [
  {
    "Loại đơn": "Đơn xin nghỉ phép",
    "Người tạo": "Nguyên Văn A",
    "Thời gian tạo": "22/02/2022 10:00",
    "Phòng ban": "Phòng kỹ thuật",
    "Chức danh": "Nhân viên",
    "Ngày tạo": "06/08/2022 10:00",
    "Trạng thái": "Chờ tổ trưởng duyệt",
    "Lịch sử cập nhật": [
      {"Người thực hiện": "Nguyễn Văn A", "Thời gian": "22/02/2022 10:00"},
      {"Người thực hiện": "Nguyễn Văn A", "Thời gian": "22/02/2022 10:00"}
    ]
  },
  {
    "Loại đơn": "Đơn xin nghỉ giữa giờ",
    "Người tạo": "Nguyên Văn A",
    "Thời gian tạo": "22/02/2022 10:00",
    "Phòng ban": "Phòng kỹ thuật",
    "Chức danh": "Kỹ thuật",
    "Ngày tạo": "06/08/2022 10:00",
    "Trạng thái": "Đã duyệt",
    "Lịch sử cập nhật": [
      {"Người thực hiện": "Nguyễn Văn A", "Thời gian": "22/02/2022 10:00"},
      {"Người thực hiện": "Nguyễn Văn A", "Thời gian": "22/02/2022 10:00"}
    ],
    "Lịch sử phê duyệt": [
      {
        "Quyết định": "Phê duyệt",
        "Người thực hiện": "Nguyễn VĂn A",
        "Ngày phê duyệt": "22/02/2022 10:0",
        "Ghi chú": "Đồng ý phê duyệt"
      },
      {
        "Quyết định": "Phê duyệt",
        "Người thực hiện": "Nguyễn VĂn A",
        "Ngày phê duyệt": "22/02/2022 10:0",
        "Ghi chú": "Đồng ý phê duyệt"
      }
    ]
  },
  {
    "Loại đơn": "Đơn xin đổi ca",
    "Người tạo": "Nguyên Văn A",
    "Thời gian tạo": "22/02/2022 10:00",
    "Phòng ban": "Phòng kỹ thuật",
    "Chức danh": "Nhân viên",
    "Ngày tạo": "06/08/2022 10:00",
    "Trạng thái": "Chờ tổ trưởng duyệt",
    "Lịch sử cập nhật": [
      {"Người thực hiện": "Nguyễn Văn A", "Thời gian": "22/02/2022 10:00"},
      {"Người thực hiện": "Nguyễn Văn A", "Thời gian": "22/02/2022 10:00"}
    ]
  },
];

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});
  static const routeName = '/application';

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  final isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      drawer: MainDrawer(),
      appBar: PrimaryAppbar(
        title: S.of(context).list_apl,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // vpad(80),
            SearchBar(onPress: () => filterApplication(context)),
            // const ApllicationCard()

            Flexible(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return ApllicationCard(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            DetailLetterScreen.routeName,
                            arguments: data[i]);
                      },
                      data: data[i],
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: WillPopScope(
        onWillPop: () async {
          if (isDialOpen.value) {
            isDialOpen.value = false;
            return false;
          } else {
            return true;
          }
        },
        child: SpeedDial(
          backgroundColor: primaryColorBase,
          overlayColor: Colors.black,
          overlayOpacity: 0.38,
          spacing: 3,
          spaceBetweenChildren: 3,
          closeManually: false,
          openCloseDial: isDialOpen,
          animatedIcon: AnimatedIcons.menu_close,
          onClose: () {},
          children: [
            SpeedDialChild(
                labelWidget: FloatLabelButton(
              icon: Icons.remove_circle,
              label: S.of(context).cr_absent,
              onPress: () {
                isDialOpen.value = false;
                Navigator.of(context).popAndPushNamed(AbsentLetter.routeName);
              },
              primary: redColor2,
            )),
            SpeedDialChild(
                labelWidget: FloatLabelButton(
              icon: Icons.access_time_filled,
              label: S.of(context).cr_break,
              onPress: () {
                isDialOpen.value = false;
                Navigator.of(context)
                    .popAndPushNamed(BreakTimeLetter.routeName);
              },
              primary: yellowColor,
            )),
            SpeedDialChild(
                labelWidget: FloatLabelButton(
              icon: Icons.compare_arrows_outlined,
              label: S.of(context).cr_change_shift,
              onPress: () {
                isDialOpen.value = false;
                Navigator.of(context)
                    .popAndPushNamed(ChangeShiftLetter.routeName);
              },
              primary: secondaryColorBase,
            )),
          ],
        ),
      ),
    );
  }
}
