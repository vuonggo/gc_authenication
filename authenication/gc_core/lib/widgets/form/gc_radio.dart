import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gc_core/gc_core.dart';
import 'package:gc_core/generated_images.dart';

class GCRadio<T> extends StatefulWidget {
  const GCRadio(
      {Key? key,
      required this.value,
      required this.groupValue,
      this.mouseCursor,
      this.toggleable = false,
      this.activeColor,
      this.fillColor,
      this.focusColor,
      this.hoverColor,
      this.overlayColor,
      this.splashRadius,
      this.materialTapTargetSize,
      this.visualDensity,
      this.focusNode,
      this.autofocus = false,
      this.onChanged})
      : assert(autofocus != null),
        assert(toggleable != null),
        super(key: key);

  final T value;
  final T? groupValue;
  final MouseCursor? mouseCursor;
  final bool toggleable;
  final Color? activeColor;
  final MaterialStateProperty<Color?>? fillColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final Color? focusColor;
  final Color? hoverColor;

  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool autofocus;

  final ValueChanged<T?>? onChanged;

  bool get _selected => value == groupValue;
  @override
  _GCRadioState<T> createState() => _GCRadioState<T>();
}

class _GCRadioState<T> extends State<GCRadio<T>>
    with TickerProviderStateMixin, ToggleableStateMixin {
  @override
  void didUpdateWidget(GCRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._selected != oldWidget._selected) {
      animateToValue();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get tristate => widget.toggleable;

  @override
  bool? get value => widget._selected;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: widget._selected,
      child: Container(
        padding: const EdgeInsets.all(0),
        height: 30,
        width: 30,
        alignment: Alignment.center,
        child: SizedBox(
          height: 20,
          width: 20,
          child: value == true ? _checkedItem() : _uncheckItem(),
        ),
      ),
    );
  }

  Widget _checkedItem() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 2),
          shape: BoxShape.circle,
          color: AppColors.primary),
      child: SizedBox(
        height: 8,
        width: 8,
        child: SvgPicture.asset(
          Ic.checkIc,
          color: AppColors.white,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _uncheckItem() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.midGrey, width: 2),
        shape: BoxShape.circle,
      ),
    );
  }

  void _handleChanged(bool? selected) {
    if (selected == null) {
      widget.onChanged!(null);
      return;
    }
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  ValueChanged<bool?>? get onChanged =>
      widget.onChanged != null ? _handleChanged : null;
}
