import 'package:buddthist_date_time/buddthist_date_time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatThai {
  /// return วันที่ เช่น "พุธ 4 พฤศจิกายน 2564 เวลา 14:42 น."
  static String thaiFullDateTime(DateTime? date, [String? locale]) {
    if (date == null) {
      return '-';
    }
    return DateFormat('EEEE d MMMM y เวลา HH:mm น.')
        .formatInBuddhistCalendarThai(date, locale);
  }

  /// return วันที่ เช่น "พุธ 4 พฤศจิกายน 2564"
  static String thaiFullDate(DateTime? date, [String? locale]) {
    if (date == null) {
      return '-';
    }
    return DateFormat('EEE d MMMM y').formatInBuddhistCalendarThai(date,locale);
  }

  /// return วันที่ เช่น "4 พฤศจิกายน 2564"
  static String thaiDate(DateTime? date, [String? locale]) {
    if (date == null) {
      return '-';
    }
    return DateFormat('d MMMM y').formatInBuddhistCalendarThai(date,locale);
  }

  /// return วันที่ เช่น "9 พ.ย. 2564 เวลา 14:42 น."
  static String thaiDateTime(DateTime? date, [String? locale]) {
    if (date == null) {
      return '-';
    }
    return DateFormat('d MMM y เวลา kk:mm น.')
        .formatInBuddhistCalendarThai(date,locale);
  }

  /// return วันที่ เช่น "พ.ย. 2564"
  static String thaiMonthYear(DateTime? date, [String? locale]) {
    if (date == null) {
      return '-';
    }
    return DateFormat('MMM y').formatInBuddhistCalendarThai(date,locale);
  }

  //return วันที่ เช่น "4 พ.ย. 2564"
  static String thaiShortDate(DateTime? date, [String? locale]) {
    if (date == null) {
      return '--/---/---';
    }
    return DateFormat('d MMM y').formatInBuddhistCalendarThai(date,locale);
  }

  //============================= date format utility ========================//

  static String convertShortDateTime(String? date, [String? locale]) {
    DateFormat inputFormat = DateFormat('dd/MMM/yyyy');

    DateTime dateTime = inputFormat.parse(date ?? "");
    return thaiShortDate(dateTime,locale);
  }

  static String convertShortDateRange(DateTimeRange? dateRange,
      [String? locale]) {
    if (dateRange == null) {
      return '';
    }

    DateTime startDate = dateRange.start;
    DateTime endDate = dateRange.end;

    String formattedStartDate = thaiShortDate(startDate,locale);
    String formattedEndDate = thaiShortDate(endDate,locale);

    return '$formattedStartDate ${'-'} $formattedEndDate';
  }

  static String convertShortTimeRange(TimeOfDay? start, TimeOfDay? end) {
    if (start == null || end == null) {
      return '';
    }

    String formattedStartTime =
        '${start.hour}:${start.minute.toString().padLeft(2, '0')}';
    String formattedEndTime =
        '${end.hour}:${end.minute.toString().padLeft(2, '0')}';

    return '$formattedStartTime ${'-'} $formattedEndTime';
  }

  static DateTime convertDateTime(String? date) {
    if (date == null || date.isEmpty) {
      return DateTime.now();
    }

    DateFormat inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS');

    DateTime dateTime = inputFormat.parse(date);
    return dateTime;
  }

  static TimeOfDay convertTime(String? time) {
    final format = DateFormat('HH:mm');
    return TimeOfDay.fromDateTime(format.parse(time ?? ""));
  }

  static String findDateTimeDifference(DateTime? date) {
    if (date == null) {
      return '-';
    }
    DateTime now = DateTime.now();

    Duration difference = now.difference(date);
    int years = difference.inDays ~/ 365;
    int month = difference.inDays ~/ 30;
    int days = difference.inDays;
    int hours = difference.inHours;
    int minutes = difference.inMinutes;
    int seconds = difference.inSeconds;

    if (years > 0) {
      return '$years ${'years'}';
    } else if (month > 0) {
      if (month == 12) {
        return '1 ${'years'}';
      }
      return '$month ${'months'}';
    } else if (days > 0) {
      return '$days ${'days'}';
    } else if (hours > 0) {
      return '$hours ${'hours'}';
    } else if (minutes > 0) {
      return '$minutes ${'minutes'}';
    } else {
      return '$seconds ${'seconds'}';
    }
  }
}
