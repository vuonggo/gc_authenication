import 'package:flutter/material.dart';
import 'package:gc_core/styles/styles.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsets margin;
  final Color borderColor;
  const FormContainer(
      {Key? key,
      required this.child,
      this.height,
      this.margin = EdgeInsets.zero,
      this.borderColor = AppColors.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 54,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor)),
        child: child);
  }
}
