import 'package:flutter/material.dart';
import 'package:gc_core/gc_core.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatelessWidget {
  final double? height;
  const Loading({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w,
        height: height ?? 100.h,
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ));
  }
}
