import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:core/core.dart';

import 'gc_radio.dart';

class RadioItemsView<T> extends StatefulWidget {
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

  const RadioItemsView({
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
  }) : super(key: key);
  @override
  _RadioItemsViewState<T> createState() => _RadioItemsViewState<T>();
}

class _RadioItemsViewState<T> extends State<RadioItemsView<T?>> {
  @override
  Widget build(BuildContext context) {
    final widgetList = <Widget>[];
    for (var i = 0; i < widget.options.length; i++) {
      widgetList.add(item(i));
    }
    Widget finalWidget;
    if (widget.orientation == OptionsOrientation.vertical) {
      finalWidget = SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgetList,
        ),
      );
    } else if (widget.orientation == OptionsOrientation.horizontal) {
      finalWidget = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgetList.map((item) {
            return Column(children: <Widget>[item]);
          }).toList(),
        ),
      );
    } else {
      finalWidget = Container(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(0),
            child: Wrap(
              spacing: 10,
              runSpacing: widget.wrapRunSpacing,
              textDirection: widget.wrapTextDirection,
              crossAxisAlignment: widget.wrapCrossAxisAlignment,
              verticalDirection: widget.wrapVerticalDirection,
              alignment: widget.wrapAlignment,
              direction: Axis.horizontal,
              runAlignment: widget.wrapRunAlignment,
              children: widgetList,
            ),
          ),
        ),
      );
    }
    return finalWidget;
  }

  Widget item(int index) {
    var size = MediaQuery.of(context).size;
    final option = widget.options[index];
    final optionValue = option.value;
    final isOptionDisabled = true == widget.disabled?.contains(optionValue);
    final checkcontrol = GestureDetector(
      onTap: isOptionDisabled
          ? null
          : () {
              log('checkcontrol--->');
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
            ? (T? selected) {
                log(
                  'checkcontrol--->$isOptionDisabled',
                );
              }
            : (T? selected) {
                widget.onChanged(selected);
              },
      ),
    );

    final label = GestureDetector(
      onTap: isOptionDisabled
          ? () {
              log(
                'label--->$isOptionDisabled',
              );
            }
          : () {
              log('label--->');
              widget.onChanged(optionValue);
            },
      child: Container(
        margin: const EdgeInsets.only(left: 0),
        child: option.child ??
            Text(widget.options[index].value?.toString() ?? '',
                textAlign: TextAlign.left,
                style: CoreAppTheme.of(context).textTheme.bodyText1),
      ),
    );

    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      width: (size.width - 40 + 10) / 2,
      child: Row(
        children: [
          if (widget.controlAffinity == ControlAffinity.leading) checkcontrol,
          Expanded(child: label),
          if (widget.controlAffinity == ControlAffinity.trailing) checkcontrol,
        ],
      ),
    );
  }
}
