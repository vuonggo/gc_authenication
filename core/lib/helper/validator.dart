import 'dart:math';

import 'package:core/helper/tiengviet/tiengviet.dart';
import 'package:diacritic/diacritic.dart';
import 'package:core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Validator {
  static String? valueExists(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please fill this field';
    } else {
      return null;
    }
  }

  static String? passwordCorrect(dynamic value) {
    var emptyResult = valueExists(value);
    if (emptyResult == null || emptyResult.isEmpty) {
      var pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[#?!@$%^&*-]).{8,}$';
      var regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return 'Your password must be at least 8 symbols with number, big and small letter and special character (!@#\$%^&*).';
      } else {
        return null;
      }
    } else {
      return emptyResult;
    }
  }

  static String? validateEmail(dynamic value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regExp = RegExp(pattern);
    var emptyResult = valueExists(value);
    if (emptyResult != null) {
      return emptyResult;
    } else if (!regExp.hasMatch(value)) {
      return 'Not a valid email address. Should be your@email.com';
    } else {
      return null;
    }
  }

  static FormFieldValidator<T> required<T>(
    BuildContext context, {
    String? errorText,
  }) {
    return FormBuilderValidators.required(context,
        errorText: errorText ?? S.of(context).fieldNotEmpty);
  }

  static FormFieldValidator<String> validateBirthYear<T>(BuildContext context,
      {String? errorText}) {
    var now = DateTime.now();
    return FormBuilderValidators.compose([
      FormBuilderValidators.min(context, 1900,
          errorText: S.current.yearInvalid + '. Chỉ từ năm 1900 tới nay'),
      FormBuilderValidators.max(context, now.year,
          errorText: S.current.yearInvalid + '. Chỉ từ năm 1900 tới nay')
    ]);
  }

  static FormFieldValidator<String> emailFormat<T>(BuildContext context,
      {String? errorText}) {
    return FormBuilderValidators.email(context,
        errorText: errorText ?? 'Email không hợp lệ. VD: yourmail@gmail.com');
  }

  static FormFieldValidator<String> dateString<T>(
    BuildContext context, {
    String? errorText,
  }) {
    return FormBuilderValidators.match(context, '--/--/----',
        errorText: errorText ?? '');
  }

  static String? validateBirthday(String? value, {bool canEmpty = false}) {
    if (value == null || value.isEmpty) {
      return canEmpty ? null : S.current.fieldNotEmpty;
    } else if (value == '--/--/----') {
      return canEmpty ? null : S.current.fieldNotEmpty;
    } else if (value.contains('-')) {
      return S.current.validBirthday;
    } else {
      var datePattern = 'dd/MM/yyyy';
      var birthDate = DateFormat(datePattern).parse(value);
      var today = DateTime.now();
      var compare = today.compareTo(birthDate);
      if (compare > 0) {
        return null;
      } else {
        return S.current.validBirthday;
      }
    }
  }

  static String? validateMobile(String? value) {
    var pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    var regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return null;
    } else if (!regExp.hasMatch(value)) {
      return S.current.validMobile;
    }
    return null;
  }

  static DateFormat get dateFormat {
    return DateFormat('dd/MM/yyyy');
  }

  static DateFormat get shortTime {
    return DateFormat('HH:mm:ss');
  }

  static DateFormat get titleTime {
    return DateFormat('HH:mm');
  }

  static DateFormat get dateFormatNCore {
    return DateFormat('yyyy-MM-dd');
  }

  static String date(String date, {String? format, bool toUTC = true}) {
    var dateTime =
        toUTC ? DateTime.parse(date).toUtc().toLocal() : DateTime.parse(date);
    return DateFormat(format ?? 'HH:mm - dd/MM/y').format(dateTime);
  }

  static RegExp filterEmoji() {
    return RegExp(r'[\u0900-\u097F]');
  }

  static RegExp filterAlphabetWithNumber() {
    return RegExp(r'[0-9a-zA-Z]');
  }

  static RegExp filterPressure() {
    return RegExp(r'[0-9/]');
  }
}

String getPureString(String item) =>
    removeDiacritics(item.toLowerCase().replaceAll(' ', ''));

String getInitials(String text) => text.isNotEmpty
    ? text.trim().split(' ').map((l) => l[0]).take(2).join()
    : '';

String gethhmmddMMydate(String date) {
  var dateTime = DateTime.parse(date);
  return DateFormat('HH:mm - dd/MM/y').format(dateTime);
}

String? getddMMydateFromMili(dynamic date) {
  if (date == null) return null;
  var dateTime = DateTime.fromMillisecondsSinceEpoch(date as int);
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

String currency(dynamic value, {String currency = ' đ'}) {
  return currencyFormatter.format(value) + currency;
}

int differentInSecond(String date) {
  var dateTime = DateTime.parse(date).toUtc().toLocal();
  var current = DateTime.now();
  return current.difference(dateTime).inSeconds;
}

final currencyFormatter = NumberFormat('#,##0', 'vi');

void makeCall(String phone) {
  launch('tel://$phone');
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1)}';
    } else {
      return this;
    }
  }

  String revertNameFirst() {
    if (isNotEmpty) {
      var endWord = split(' ').last;
      var lastStr = replaceAll(endWord, '');
      var revertStr = endWord + ' ' + lastStr;
      return revertStr.trim();
    }
    return this;
  }

  String nomalizerTiengViet() {
    if (isNotEmpty) {
      var tiengvietkhongdau = TiengViet.parse(this);
      return tiengvietkhongdau;
    }
    return this;
  }

  String withItemList() {
    return '\u2022 ${this}';
  }

  String revertSingleSpace() {
    // Regex to replace multiple spaces with a single space
    // Given that you also want to cover tabs, newlines, etc, just replace \s\s+ with ' ':
    // var pattern = r'/\s\s+/g';
    // var regExp = RegExp(pattern);

    // var subString = replaceAll(RegExp(r'[^\w\s]+'), ' ');
    return replaceAll(RegExp(' +'), ' ');
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
