import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../gc_core.dart';

class Skeleton extends StatelessWidget {
  final Widget child;
  const Skeleton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.grey.withOpacity(0.5),
        highlightColor: AppColors.grey.withOpacity(0.25),
        child: child);
  }
}
