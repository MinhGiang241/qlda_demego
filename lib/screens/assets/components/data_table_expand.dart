import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constant/constants.dart';
import '../../../widgets/primary_card.dart';

class DataTableExpand extends StatefulWidget {
  DataTableExpand({super.key, required this.titles, required this.data});

  final titles;
  final data;

  @override
  State<DataTableExpand> createState() => _DataTableExpandState();
}

class _DataTableExpandState extends State<DataTableExpand> {
  var _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryCard(
          child: Column(
            children: [
              Row(
                children: [
                  ...widget.titles.asMap().entries.map(
                        (t) => Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            border: t.value != 'STT'
                                ? const Border(
                                    left: BorderSide(
                                      color: grayScaleColor3,
                                      width: 1,
                                    ),
                                  )
                                : null,
                          ),
                          width: t.value == "STT" ? 40 : 120,
                          child: InkWell(
                            onTap: t.value == "Tên nhà cung cấp"
                                ? () {
                                    setState(() {
                                      _expanded = !_expanded;
                                    });
                                  }
                                : null,
                            child: Column(
                              children: [
                                if (widget.data.key == 0)
                                  Text(
                                    t.value.toString(),
                                    textAlign: TextAlign.center,
                                    style: txtBodySmallBold(
                                      color: grayScaleColorBase,
                                    ),
                                  ),
                                if (widget.data.key == 0) vpad(18),
                                Row(
                                  mainAxisAlignment:
                                      t.value == "Tên nhà cung cấp"
                                          ? MainAxisAlignment.spaceAround
                                          : MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      (widget.data.value[t.key].runtimeType ==
                                                  List ||
                                              widget.data.value[t.value] ==
                                                  null)
                                          ? ""
                                          : widget.data.value[t.value]
                                              .toString(),
                                      textAlign: TextAlign.center,
                                      style: txtBodySmallBold(),
                                    ),
                                    if (t.value == "Tên nhà cung cấp")
                                      Icon(
                                        size: 20,
                                        _expanded
                                            ? Icons.expand_more
                                            : Icons.expand_less,
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                ],
              ),
            ],
          ),
        ),
        vpad(6)
      ],
    );
  }
}
