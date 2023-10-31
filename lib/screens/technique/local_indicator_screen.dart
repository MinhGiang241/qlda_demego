import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/utils/sqlflite.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_loading.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../utils/utils.dart';
import '../../widgets/float_button.dart';
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
        var loading = context.watch<LocalIndicatorPrv>().loading;
        var floatButtons = [
          DialChildren(
            label: "Xóa tất cả",
            icon: Icons.send,
            primary: redColorBase,
            onPress: () async {
              Utils.showConfirmMessage(
                context: context,
                title: "Xóa tất cả dữ liệu",
                content: "Bạn có chắc chắn muốn xóa tất cả dữ liệu!",
                onConfirm: () async {
                  await SqlfliteServices.shared.deleteAll().then((v) {
                    Utils.showSuccessMessage(
                      context: context,
                      e: "Xóa tất cả dữ liệu thành công",
                      onClose: () {
                        Navigator.pop(context);
                        context.read<LocalIndicatorPrv>().clearData();
                      },
                    );
                  });
                },
              );
            },
          ),
          DialChildren(
            label: "Gửi tất cả chỉ số nước",
            icon: Icons.send,
            primary: greenColorBase,
            onPress: () async {
              await context
                  .read<LocalIndicatorPrv>()
                  .sendDataToServer(context, false);
            },
          ),
          DialChildren(
            label: "Gửi tất cả chỉ số điện",
            icon: Icons.send,
            primary: yellowColorBase,
            onPress: () async {
              await context
                  .read<LocalIndicatorPrv>()
                  .sendDataToServer(context, true);
            },
          ),
        ];

        return PrimaryScreen(
          appBar: const PrimaryAppbar(title: "Dữ liệu chưa được gửi lên "),
          floatingActionButton:
              loading ? null : FloatDialButton(data: floatButtons),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    vpad(12),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryTextField(
                            controller: context
                                .watch<LocalIndicatorPrv>()
                                .dateController,
                            hint: "mm/yyyy",
                            isReadOnly: true,
                            suffixIcon: const PrimaryIcon(
                              icons: PrimaryIcons.calendar,
                            ),
                            onTap: () {
                              context
                                  .read<LocalIndicatorPrv>()
                                  .pickDate(context);
                            },
                          ),
                        ),
                        hpad(10),
                        Expanded(
                          child: PrimaryTextField(
                            textInputAction: TextInputAction.go,
                            onFieldSubmitted: (_) async {
                              FocusScope.of(context).unfocus();
                              await context
                                  .read<LocalIndicatorPrv>()
                                  .getAllApartmentFromLocal(true);
                            },
                            controller: context
                                .watch<LocalIndicatorPrv>()
                                .searchConttroller,
                            hint: "Nhập tên căn hộ cần tìm kiếm",
                            suffixIcon: IconButton(
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
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
                if (context.watch<LocalIndicatorPrv>().loading)
                  Positioned.fill(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      color: Colors.black.withOpacity(0.4),
                      child: const Center(child: PrimaryLoading()),
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
