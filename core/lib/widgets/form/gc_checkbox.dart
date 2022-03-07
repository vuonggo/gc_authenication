import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:core/core.dart';
import 'package:core/generated_images.dart';

class GCCheckBox extends StatefulWidget {
  const GCCheckBox({Key? key, this.selected}) : super(key: key);
  final bool? selected;

  @override
  _GCCheckBoxState createState() => _GCCheckBoxState();
}

class _GCCheckBoxState<T> extends State<GCCheckBox>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: widget.selected,
      child: Container(
        padding: const EdgeInsets.all(0),
        height: 30,
        width: 30,
        alignment: Alignment.center,
        child: SizedBox(
          height: 20,
          width: 20,
          child: widget.selected == true ? _checkedItem() : _uncheckItem(),
        ),
      ),
    );
  }

  Widget _checkedItem() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 2),
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(4),
      ),
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
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
