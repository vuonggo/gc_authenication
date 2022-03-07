// Extended Raised button for G1 Mobile App
// Author: baocq@galaxy.one
// Date: 2021-05-26

import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/size.dart';

class G1MobileButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final String title;
  final IconData? icon;
  final double iconSize;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const G1MobileButton({
    Key? key,
    this.width,
    this.height,
    required this.title,
    required this.onPressed,
    this.icon,
    this.backgroundColor = AppColors.accent,
    this.textColor = AppColors.primary,
    this.borderColor = AppColors.accent,
    this.iconSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = CoreAppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 11.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildIcon(_theme),
                _buildTitle(_theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(ThemeData _theme) {
    return Text(
      title,
      style: _theme.textTheme.subtitle2?.copyWith(color: textColor),
    );
  }

  Widget _buildIcon(ThemeData theme) {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: theme.textTheme.button?.color,
        ),
      );
    }

    return const SizedBox();
  }
}
