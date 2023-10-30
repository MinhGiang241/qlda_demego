import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../widgets/primary_icon.dart';
import 'prv/local_indicator_prv.dart';
import 'tabs/indicator_tab.dart';

class LocalIndicatorScreen extends StatefulWidget {
  const LocalIndicatorScreen({super.key});
  static const routeName = "/local";

  @override
  State<LocalIndicatorScreen> createState() => _LocalIndicatorScreenState();
}

class _LocalIndicatorScreenState extends State<LocalIndicatorScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await context.read<LocalIndicatorPrv>().getAllApartmentFromLocal();
    // });
  }

  @override
  Widget build(BuildContext context) {
    late TabController tabController = TabController(length: 2, vsync: this);
    return ChangeNotifierProvider(
      create: (context) => LocalIndicatorPrv(),
      builder: (context, child) {
        return PrimaryScreen(
          appBar: const PrimaryAppbar(title: "Dữ liệu chưa được gửi lên "),
          body: SafeArea(
            child: Column(
              children: [
                vpad(12),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryTextField(
                        controller:
                            context.watch<LocalIndicatorPrv>().dateController,
                        hint: "mm/yyyy",
                        isReadOnly: true,
                        suffixIcon: const PrimaryIcon(
                          icons: PrimaryIcons.calendar,
                        ),
                        onTap: () {
                          context.read<LocalIndicatorPrv>().pickDate(context);
                        },
                      ),
                    ),
                    hpad(10),
                    Expanded(
                      child: PrimaryTextField(
                        controller: context
                            .watch<LocalIndicatorPrv>()
                            .searchConttroller,
                        hint: "Nhập tên căn hộ cần tìm kiếm",
                        suffixIcon: IconButton(
                          onPressed: () async {
                            await context
                                .read<LocalIndicatorPrv>()
                                .getAllApartmentFromLocal(true);
                          },
                          icon: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                vpad(10),
                TabBar(
                  controller: tabController,
                  labelColor: grayScaleColor1,
                  labelStyle: txtLinkSmall(),
                  tabs: const [
                    Tab(
                      text: " Chỉ số điện",
                    ),
                    Tab(
                      text: " Chỉ số nước",
                    ),
                  ],
                ),
                vpad(10),
                Flexible(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      IndicatorTab(
                        isElectric: true,
                      ),
                      IndicatorTab(
                        isElectric: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
