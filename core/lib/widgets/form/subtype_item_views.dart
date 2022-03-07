import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:core/core.dart';

import 'gc_radio.dart';

class SubtypeItemsView<T> extends StatefulWidget {
  final List<FormBuilderFieldOption<T>> options;

  final T? value;
  final List<T>? disabled;
  final OptionsOrientation orientation;
  final ValueChanged<T?> onChanged;
  final Color? activeColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Color? focusColor;
  final Color? hoverColor;
  final Axis wrapDirection;
  final WrapAlignment wrapAlignment;
  final double wrapSpacing;
  final WrapAlignment wrapRunAlignment;
  final double wrapRunSpacing;

  final WrapCrossAlignment wrapCrossAxisAlignment;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;

  final ControlAffinity controlAffinity;
  final bool? isBorder;

  const SubtypeItemsView({
    Key? key,
    required this.options,
    required this.orientation,
    required this.onChanged,
    this.value,
    this.disabled,
    this.activeColor,
    this.focusColor,
    this.hoverColor,
    this.materialTapTargetSize,
    this.wrapDirection = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapSpacing = 0.0,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    this.controlAffinity = ControlAffinity.leading,
    this.isBorder = true,
  }) : super(key: key);
  @override
  _SubtypeItemsViewState<T> createState() => _SubtypeItemsViewState<T>();
}

class _SubtypeItemsViewState<T> extends State<SubtypeItemsView<T?>> {
  @override
  Widget build(BuildContext context) {
    final widgetList = <Widget>[];
    for (var i = 0; i < widget.options.length; i++) {
      widgetList.add(item(i));
    }
    Widget finalWidget;
    finalWidget = Container(
      alignment: Alignment.centerLeft,
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ...widgetList.map((e) => Expanded(flex: 1, child: e)),
        ],
      ),
    );
    return finalWidget;
  }

  Widget item(int index) {
    final option = widget.options[index];
    final optionValue = option.value;
    final isOptionDisabled = true == widget.disabled?.contains(optionValue);
    final checkcontrol = GestureDetector(
      onTap: isOptionDisabled
          ? null
          : () {
              widget.onChanged(optionValue);
            },
      child: GCRadio<T?>(
        groupValue: widget.value,
        activeColor: widget.activeColor,
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        materialTapTargetSize: widget.materialTapTargetSize,
        value: optionValue,
        onChanged: isOptionDisabled
            ? null
            : (T? selected) {
                widget.onChanged(selected);
              },
      ),
    );

    final label = Container(
      margin: const EdgeInsets.only(left: 0),
      color: AppColors.pink,
    );

    return GestureDetector(
      onTap: isOptionDisabled
          ? null
          : () {
              widget.onChanged(optionValue);
            },
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        alignment: Alignment.center,
        decoration: widget.isBorder == true
            ? BoxDecoration(
                border: Border.all(color: AppColors.borderControl, width: 1),
                borderRadius: BorderRadius.circular(10))
            : const BoxDecoration(color: AppColors.transparent),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.controlAffinity == ControlAffinity.leading) checkcontrol,
            if (widget.controlAffinity == ControlAffinity.trailing)
              checkcontrol,
          ],
        ),
      ),
    );
  }
}
