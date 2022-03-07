import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatelessWidget {
  final double? height;
  final double? width;
  const Loading({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 100.w,
        height: height ?? 100.h,
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ));
  }
}
