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
  var _expanded = false;
  double _animatedHeight = 0.0;
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
                          width: t.value == "STT" ? 45 : 120,
                          child: InkWell(
                            onTap: t.value == "Tên nhà cung cấp"
                                ? () {
                                    setState(() {
                                      _expanded = !_expanded;

                                      _animatedHeight != 0.0
                                          ? _animatedHeight = 0.0
                                          : _animatedHeight = 51 *
                                              double.parse(
                                                widget.data.value['Danh sách']
                                                    .length
                                                    .toString(),
                                              );
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
        vpad(6),
        // if (_expanded)
        AnimatedContainer(
          height: _animatedHeight,
          duration: Duration(
            milliseconds: 30 *
                int.parse(widget.data.value['Danh sách'].length.toString()),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...widget.data.value["Danh sách"].map((e) {
                  return Column(
                    children: [
                      PrimaryCard(
                        margin: const EdgeInsets.only(left: 40),
                        background: const Color(0xffFFFFFF).withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        width: 120 * 5 + 1,
                        child: Row(
                          children: [
                            ...e.keys.map(
                              (i) => Container(
                                decoration: BoxDecoration(
                                  border: i != 'Tài sản'
                                      ? const Border(
                                          left: BorderSide(
                                            color: grayScaleColor3,
                                            width: 1,
                                          ),
                                        )
                                      : null,
                                ),
                                width: 120,
                                child: Text(
                                  e[i].toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      vpad(6)
                    ],
                  );
                }),
              ],
            ),
          ),
        )
      ],
    );
  }
}
