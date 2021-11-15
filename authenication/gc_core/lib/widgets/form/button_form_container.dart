import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gc_core/gc_core.dart';

class ButtonFormContainer extends StatelessWidget {
  final Widget text;
  final Widget? icon;
  final double? height;
  final VoidCallback press;
  final bool isLoading;
  const ButtonFormContainer(
      {Key? key,
      required this.text,
      this.height,
      this.icon,
      required this.press,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? AppConsts.buttonHeight,
        width: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
              gradient: AppColors.primaryLinearGradient,
              borderRadius: AppConsts.kCardBorder),
          child: ElevatedButton(
            onPressed: () {
              if (isLoading) {
                return;
              }
              press();
            },
            child: isLoading
                ? const SpinKitCircle(
                    color: Colors.white,
                    size: 30.0,
                  )
                : icon == null
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          text,
                        ],
                      )
                    : text,
          ),
        ));
  }
}
