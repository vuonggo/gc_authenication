import 'package:flutter/material.dart';
import 'package:core/core.dart';

class AlignWrap extends StatelessWidget {
  final List<Widget> widgets;
  final Alignment align;
  final double spacing;
  final double runSpacing;
  const AlignWrap(
      {Key? key,
      required this.widgets,
      this.align = Alignment.centerLeft,
      this.spacing = 0,
      this.runSpacing = AppConsts.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: align,
        child: Wrap(
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            spacing: spacing,
            runSpacing: runSpacing,
            children: widgets));
  }
}
