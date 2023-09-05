import 'package:flutter/material.dart' hide SearchBar;
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/Info_table.dart';
import '../../widgets/primary_screen.dart';
import 'add_customer_screen.dart';

var data = [
  {
    "ID": "0001",
    "Tên khách hàng": "Nguyễn Văn A",
    "Số điện thoại": "0123456789",
    "CCCD": "197604409277",
    "Tên tòa": "A1",
    "Tầng": "12",
    "Mặt bằng": "1908",
  },
  {
    "ID": "0002",
    "Tên khách hàng": "Nguyễn Văn A",
    "Số điện thoại": "0123456789",
    "CCCD": "197604409277",
    "Tên tòa": "A1",
    "Tầng": "12",
    "Mặt bằng": "1908"
  },
  {
    "ID": "0003",
    "Tên khách hàng": "Nguyễn Văn A",
    "Số điện thoại": "0123456789",
    "CCCD": "197604409277",
    "Tên tòa": "A1",
    "Tầng": "12",
    "Mặt bằng": "1908"
  },
];

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});
  static const routeName = '/customer';

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).customer_list),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(),
            Flexible(
              child: ListView(
                children: [
                  ...data.asMap().entries.map(
                        (e) => InfoTable(
                          data: data[e.key],
                        ),
                      )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColorBase,
        onPressed: () {
          Navigator.of(context).pushNamed(
            AddCustomerScreen.routeName,
          );
        },
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
