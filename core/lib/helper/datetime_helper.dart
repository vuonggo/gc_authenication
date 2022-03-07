import 'package:core/l10n/generated/l10n.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String date(String date, {String? format, bool toUTC = true}) {
    var dateTime =
        toUTC ? DateTime.parse(date).toUtc().toLocal() : DateTime.parse(date);
    return DateFormat(format ?? 'HH:mm - dd/MM/y').format(dateTime);
  }

  String getWeekDayText() {
    var weekday = this.weekday;
    switch (weekday) {
      case 1:
        return S.current.monday;
      case 2:
        return S.current.tuesday;
      case 3:
        return S.current.wednesday;
      case 4:
        return S.current.thurday;
      case 5:
        return S.current.friday;
      case 6:
        return S.current.saturday;
      case 7:
        return S.current.sunday;
      default:
        return '';
    }
  }

  static String getTodayText() {
    return S.current.today;
  }

  static String getTomorrowText() {
    return S.current.tomorrow;
  }

  bool isTomorrow() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final aDate = DateTime(year, month, day);
    if (aDate == tomorrow) {
      return true;
    } else {
      return false;
    }
  }

  String shortDay() {
    var dateString = '$day/$month';
    return dateString;
  }

  String shortTime() {
    var numFormat = minute.toString().padLeft(2, '0');
    var dateString = '$hour:$numFormat';
    return dateString;
  }

  static DateFormat get dateFormat {
    return DateFormat('dd/MM/yyyy');
  }

  static DateFormat get dateFormatNCore {
    return DateFormat('yyyy-MM-dd');
  }

  static DateFormat get datetimeFormatNCore {
    return DateFormat('yyyy-MM-dd hh:mm:ss');
  }

  static DateFormat get timeSlotFormat {
    return DateFormat('hh:mm:ss');
  }
}
