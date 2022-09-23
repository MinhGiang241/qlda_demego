import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../generated/l10n.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      children: [
        Expanded(
            child: PrimaryTextField(
          hint: S.of(context).save,
          prefixIcon: const Padding(
              padding: EdgeInsets.all(12.0), child: Text('jjjj')
              // PrimaryIcon(
              //     icons: PrimaryIcons.search_outline, color: grayScaleColor2),
              ),
        )),
        Text('jjjj'),
        Text('jjjj'),
        Text('jjjj'),
        Text('jjjj'),
      ],
    ));
  }
}
