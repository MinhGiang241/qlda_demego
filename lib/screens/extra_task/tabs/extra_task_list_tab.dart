import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../../widgets/Info_table.dart';
import '../extra_task_detail_screen.dart';

class ExtraTaskListTab extends StatelessWidget {
  const ExtraTaskListTab({super.key, this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SearchBar(),
          ),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ExtraTaskDetailScreen.routeName,
                      arguments: data[i],
                    );
                  },
                  child: InfoTable(
                    data: data[i],
                    num: 8,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
