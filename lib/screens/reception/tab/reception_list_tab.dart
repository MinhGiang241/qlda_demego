import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/Info_table.dart';
import '../../../widgets/primary_button.dart';
import '../infomation_reception_details_screen.dart';

class ReceptionListTab extends StatelessWidget {
  const ReceptionListTab({super.key, this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      shrinkWrap: true,
      children: [
        vpad(12),
        ...data.asMap().entries.map(
              (e) => InfoTable(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    InformationReceptionDetailScreen.routeName,
                    arguments: data[e.key],
                  );
                },
                data: e.value,
                child: (data[e.key]['Trạng thái'] == 'Đang xử lý' ||
                        data[e.key]['Trạng thái'] == 'Chờ xử lý')
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          (data[e.key]['Trạng thái'] == 'Chờ xử lý')
                              ? const Spacer()
                              : PrimaryButton(
                                  text: S.of(context).reply,
                                  buttonSize: ButtonSize.small,
                                  buttonType: ButtonType.yeallow,
                                  onTap: () {},
                                ),
                          hpad(35),
                          PrimaryButton(
                            text: S.of(context).cr_task,
                            buttonSize: ButtonSize.small,
                            onTap: () {},
                          ),
                          hpad(12)
                        ],
                      )
                    : null,
              ),
            ),
        vpad(70)
      ],
    );
  }
}
