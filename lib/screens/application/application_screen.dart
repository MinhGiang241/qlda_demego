import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});
  static const routeName = '/application';

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  final isDialOpen = ValueNotifier(false);

  void filterApplication() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
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
                          onChanged: (_) {
                            setState(() {});
                          }),
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
                              onChanged: (_) {
                                setState(() {});
                              }),
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
                              onChanged: (_) {
                                setState(() {});
                              }),
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
                          onChanged: (_) {
                            setState(() {});
                          }),
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
                          onChanged: (_) {
                            setState(() {});
                          }),
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
                              onChanged: (_) {
                                setState(() {});
                              }),
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
                              onChanged: (_) {
                                setState(() {});
                              }),
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
                              onChanged: (_) {
                                setState(() {});
                              }),
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
                              onChanged: (_) {
                                setState(() {});
                              }),
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
                              onChanged: (_) {
                                setState(() {});
                              }),
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
                              onChanged: (_) {
                                setState(() {});
                              }),
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
            vpad(76),
            SearchBar(onPress: filterApplication),
            const ApllicationCard()
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
          children: [
            SpeedDialChild(
                labelWidget: FloatLabelButton(
              icon: Icons.remove_circle,
              label: S.of(context).cr_off_day,
              onPress: () {
                print("Click");
              },
              primary: redColor2,
            )),
            SpeedDialChild(
                labelWidget: FloatLabelButton(
              icon: Icons.access_time_filled,
              label: S.of(context).cr_off_on,
              onPress: () {
                print("Click");
              },
              primary: yellowColor,
            )),
            SpeedDialChild(
                labelWidget: FloatLabelButton(
              icon: Icons.compare_arrows_outlined,
              label: S.of(context).cr_change_shift,
              onPress: () {
                print("Click");
              },
              primary: secondaryColorBase,
            )),
          ],
        ),
      ),
    );
  }
}
