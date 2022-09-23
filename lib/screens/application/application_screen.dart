import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../generated/l10n.dart';
import '../../widgets/primary_appbar.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});
  static const routeName = '/application';

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
        drawer: MainDrawer(),
        appBar: PrimaryAppbar(
          title: S.of(context).list_apl,
        ),
        body: Column(
          children: [SearchBar()],
        ));
  }
}
