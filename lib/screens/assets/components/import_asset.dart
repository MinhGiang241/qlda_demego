import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../widgets/Info_table.dart';

class ImportAsset extends StatelessWidget {
  const ImportAsset({super.key, this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [Container(), InfoTable(data: data)]),
    );
  }
}
