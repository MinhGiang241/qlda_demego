import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/Info_table.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../utils/dialog.dart';
import '../../widgets/primary_screen.dart';
import '../../widgets/primary_text_field.dart';
import 'dialog/service_dialog.dart';

class AddServiceForResidentScreen extends StatelessWidget {
  const AddServiceForResidentScreen({super.key});
  static const routeName = '/resident-card/add-service';

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: S.of(context).add_service_for_res,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            vpad(12),
            PrimaryTextField(
              label: S.of(context).customer,
              isRequired: true,
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).card_num,
              isRequired: true,
            ),
            vpad(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  text: S.of(context).add_service,
                  onTap: () {
                    showAddServiceDialog(context, () {});
                  },
                ),
              ],
            ),
            vpad(12),
            Text(
              S.of(context).service,
              style: txtBodySmallRegular(color: primaryColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            ...arg["Dịch vụ"].map(
              (e) => InfoTable(
                data: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryButton(
                      text: S.of(context).update,
                      buttonSize: ButtonSize.small,
                      onTap: () {},
                    ),
                    hpad(35),
                    PrimaryButton(
                      text: S.of(context).delete,
                      buttonSize: ButtonSize.small,
                      buttonType: ButtonType.secondary,
                      secondaryBackgroundColor: redColor4,
                      textColor: redColor,
                      onTap: () {
                        onConfirmDelete(
                          context,
                          S.of(context).confirm_detele_config,
                          () {},
                        );
                      },
                    ),
                    hpad(12),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
