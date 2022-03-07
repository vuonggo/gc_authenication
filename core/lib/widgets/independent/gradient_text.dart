import 'package:flutter/material.dart';
import '../../core.dart';

class GradientText extends StatelessWidget {
  final Widget widget;
  const GradientText({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) =>
            AppColors.primaryLinearGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
        child: widget);
  }
}
