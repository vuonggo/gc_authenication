import 'package:flutter/material.dart';

class AppConsts {
  static const pageSize = 20;
  static const defaultFont = 'GoogleSans';
  static const kDefaultPadding = 16.0;
  static const buttonHeight = 54.0;

  /// This is the common border radious of all the containers in the app.
  static const kStandardBorder = BorderRadius.all(Radius.circular(8));

  /// This is the common border radious of all the containers in the app.
  static const kCardBorder = BorderRadius.all(Radius.circular(kDefaultPadding));

  /// This border is slightly more sharp than the standard boder.
  static const kSharpBorder = BorderRadius.all(Radius.circular(2));

  static const mHorizontal =
      EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding);

  static const mVertical =
      EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding);

  static const kMarginAll = EdgeInsets.all(kDefaultPadding);

  static final kStandardShadow = BoxShadow(
      spreadRadius: -5,
      blurRadius: 10,
      color: Colors.black.withOpacity(.20),
      offset: const Offset(0, 4));
  static const kCellShadow = BoxShadow(
    spreadRadius: -10,
    blurRadius: 60,
    color: Color.fromARGB(20, 29, 29, 31),
    offset: Offset(4, 12),
  );
}
