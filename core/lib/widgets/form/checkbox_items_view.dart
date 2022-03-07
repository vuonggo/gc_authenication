import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:core/core.dart';

import 'gc_checkbox.dart';

class CheckBoxItemsView<T> extends StatefulWidget {
  final List<FormBuilderFieldOption<T>> options;
  final List<T>? value;
  final List<T>? disabled;
  final OptionsOrientation orientation;
  final ValueChanged<List<T>> onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final bool tristate;
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
  final Widget? separator;
  final ControlAffinity controlAffinity;
  final bool? isBorder;
  final bool? isShortAnwser;
  const CheckBoxItemsView({
    Key? key,
    required this.options,
    required this.orientation,
    required this.onChanged,
    this.value,
    this.disabled,
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.materialTapTargetSize,
    this.tristate = false,
    this.wrapDirection = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapSpacing = 10.0,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 10.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    this.separator,
    this.controlAffinity = ControlAffinity.leading,
    this.isBorder = true,
    this.isShortAnwser = false,
  }) : super(key: key);

  @override
  _CheckBoxItemsViewState<T> createState() => _CheckBoxItemsViewState<T>();
}

class _CheckBoxItemsViewState<T> extends State<CheckBoxItemsView<T>> {
  final selectedListItems = <T>[];

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      selectedListItems.addAll(widget.value!);
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.value != null && widget.value!.isNotEmpty) {
    //   List<T>? newArray = List.empty();
    //   for (var i in widget.value!) {
    //     if (!selectedListItems.contains(i)) {
    //       newArray.add(i);
    //     }
    //   }
    //   if (newArray.isNotEmpty) {
    //     selectedListItems.addAll(newArray);
    //   }
    // }
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
          children: widgetList.map((item) {
            return Column(children: <Widget>[item]);
          }).toList(),
        ),
      );
    } else {
      finalWidget = SingleChildScrollView(
        child: Wrap(
          spacing: widget.wrapSpacing,
          runSpacing: widget.wrapRunSpacing,
          textDirection: widget.wrapTextDirection,
          crossAxisAlignment: widget.wrapCrossAxisAlignment,
          verticalDirection: widget.wrapVerticalDirection,
          alignment: widget.wrapAlignment,
          direction: Axis.horizontal,
          runAlignment: widget.wrapRunAlignment,
          children: widgetList,
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
    final control = GestureDetector(
      onTap: isOptionDisabled
          ? null
          : () {
              selectedListItems.contains(optionValue)
                  ? selectedListItems.remove(optionValue)
                  : selectedListItems.add(optionValue);
              setState(() {
                widget.onChanged(selectedListItems);
              });
            },
      child: GCCheckBox(
        selected: selectedListItems.contains(optionValue),
      ),
    );
    final label = GestureDetector(
      onTap: isOptionDisabled
          ? null
          : () {
              selectedListItems.contains(optionValue)
                  ? selectedListItems.remove(optionValue)
                  : selectedListItems.add(optionValue);
              setState(() {
                widget.onChanged(selectedListItems);
              });
            },
      child: Container(
        padding: const EdgeInsets.only(left: 0, top: 5, bottom: 5),
        child: option.child ??
            Text(option.value?.toString() ?? '',
                textAlign: TextAlign.left,
                style: CoreAppTheme.of(context).textTheme.bodyText1),
      ),
    );

    var widthItem =
        widget.isShortAnwser == true ? (size.width - 40) / 2 : size.width;
    return Container(
      margin: EdgeInsets.only(top: widget.wrapSpacing),
      padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
      width: widthItem,
      decoration: widget.isBorder == true
          ? BoxDecoration(
              border: Border.all(color: AppColors.borderControl, width: 1),
              borderRadius: BorderRadius.circular(10))
          : const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          if (widget.controlAffinity == ControlAffinity.leading) control,
          Expanded(flex: 1, child: label),
          if (widget.controlAffinity == ControlAffinity.trailing) control,
          if (widget.separator != null && index != widget.options.length - 1)
            widget.separator!,
        ],
      ),
    );
  }
}
