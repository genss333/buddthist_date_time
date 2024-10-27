import 'package:intl/intl.dart';

extension BuddhistCalendarFormatter on DateFormat {
  String formatInBuddhistCalendarThai(DateTime dateTime, [String? locale]) {
    String? lang = locale ?? Intl.getCurrentLocale();

    if (pattern!.contains('y')) {
      var buddhistDateTime = DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond);

      if (lang.contains('th')) {
        // Get the year in Buddhist calendar
        var buddhistYear = buddhistDateTime.year + 543;

        // Format the date
        var dateTimeString =
            DateFormat(pattern, 'th_TH').format(buddhistDateTime);

        // Replace the Gregorian year with the Buddhist year
        dateTimeString = dateTimeString.replaceAll(
            buddhistDateTime.year.toString(), buddhistYear.toString());

        // Replace 'ค.ศ.' (AD) with 'พ.ศ.' (BE)
        dateTimeString = dateTimeString.replaceAll('ค.ศ.', 'พ.ศ.');

        return dateTimeString;
      } else {
        var result = format(buddhistDateTime);
        return result;
      }
    }
    return format(dateTime);
  }
}
