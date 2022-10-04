import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qlda_demego/bloc/asset/asset_list/asset_list_action.dart';
import 'package:qlda_demego/bloc/asset/asset_list/asset_list_state.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/connect_error.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../bloc/asset/asset_list/asset_list_bloc.dart';
import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../models/asset_model.dart';
import '../../services/api/api_asset.dart';
import '../../utils/utils.dart';
import '../../widgets/Info_table.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_dialog.dart';
import '../../widgets/search_bar.dart';
import 'asset_detail.dart';
import 'create_request_purchase_screen.dart';

var data = [
  {
    "Tên tài sản": "Kìm chống điện",
    "Đơn vị tính": "Cái",
    "Tồn kho": 10,
    "Bộ phận": "Kỹ thuật",
    "Loại": "Vật tư",
    "Nhóm": "Kim"
  },
  {
    "Tên tài sản": "Kìm chống điện",
    "Đơn vị tính": "Cái",
    "Tồn kho": 10,
    "Bộ phận": "Kỹ thuật",
    "Loại": "Vật tư",
    "Nhóm": "Kim"
  },
  {
    "Tên tài sản": "Kìm chống điện",
    "Đơn vị tính": "Cái",
    "Tồn kho": 10,
    "Bộ phận": "Kỹ thuật",
    "Loại": "Vật tư",
    "Nhóm": "Kim"
  },
];

class AssetScreen extends StatefulWidget {
  static const routeName = '/asset';
  const AssetScreen({super.key});

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  final isDialOpen = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).req_export,
        icon: Icons.logout,
        primary: primaryColor1,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).req_import,
        icon: Icons.login,
        primary: yellowColor,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).inventory,
        icon: Icons.check_circle,
        primary: greenColor,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).recommend_purchase,
        icon: Icons.shopping_cart,
        primary: purpleColor,
        onPress: () {
          Navigator.of(context)
              .pushNamed(CreateRequestPurchaseScreen.routeName);
        },
      ),
    ];

    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).asset_manage),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<AssetListBloc, AssetListState>(
          builder: (context, state) {
            var dataListInfo = (state.assetList)
                .map(
                  (Asset e) => {
                    "Tên tài sản": e.displayName,
                    "Code": e.code,
                    "Ngày tạo": (e.createdTime!).formatDateTimeHmDMY(),
                    "Ngày cập nhật": (e.updatedTime!).formatDateTimeHmDMY(),
                    "Loại Tài sản": e.assetType!.displayName,
                    "Số lượng": e.amount.toString(),
                  },
                )
                .toList();
            if (state.init! && state.isLoading) {
              context.read<AssetListBloc>().add(const LoadAssetListAction());

              return Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
              );
            } else if (state.isLoading) {
              return Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
              );
            } else if (state.errorHandle != null) {
              return ConnectError(
                title: state.errorHandle!.msg,
                onTap: () {
                  context
                      .read<AssetListBloc>()
                      .add(const LoadAssetListAction());
                },
              );
            } else if (state.assetList.isEmpty) {
              return Center(
                child: Text(S.of(context).no_asset, style: txtBodyMediumBold()),
              );
            } else {
              return Column(
                children: [
                  SearchBar(
                    onPress: () async {
                      // await ApiAsset.getAssetList();
                      context
                          .read<AssetListBloc>()
                          .add(const LoadAssetListAction());
                    },
                  ),
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: dataListInfo.length,
                      itemBuilder: (context, i) {
                        return InfoTable(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AssetDetailScreen.routeName,
                              arguments: {"data": state.assetList[i]},
                            );
                          },
                          data: dataListInfo[i],
                        );
                      },
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatDialButton(
        data: floatButtons,
      ),
    );
  }
}
