import 'package:buddthist_date_time/buddthist_date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

import 'date_picker_custom.dart';

class DatePickerMaterial extends StatelessWidget {
  const DatePickerMaterial({
    super.key,
    required this.label,
    this.date,
    required this.onChangeDate,
    this.minDate,
    this.maxDate,
    this.enable = true,
    required this.locale,
  });

  final String label;
  final DateTime? date;
  final Function(DateTime) onChangeDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final bool? enable;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    void showPicker() async {
      DateTime? picked = await showRoundedDatePicker(
        context: context,
        locale: locale,
        era: locale.languageCode.contains('th')
            ? EraMode.BUDDHIST_YEAR
            : EraMode.CHRIST_YEAR,
        initialDate: date ?? minDate,
        firstDate: minDate,
        lastDate: maxDate,
        theme: Theme.of(context),
        styleDatePicker: _datePickerStyle,
        styleYearPicker: _yearPickerStyle,
      );
      if (picked != null) {
        onChangeDate(picked);
      }
    }

    return InkWell(
      onTap: () {
        if (enable == true) {
          showPicker();
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff4f4f4),
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          labelStyle: ThemeData().textTheme.labelMedium,
          suffixIcon: Icon(
            Icons.calendar_month_rounded,
            color: enable == true
                ? ThemeData().primaryColor
                : const Color(0xfff4f4f4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            date != null
                ? Text(
                    DateFormatThai.thaiDate(date, locale.languageCode),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
                : Text(
                    locale.languageCode.contains('th')
                        ? "เลือก วว/ดด/ปป"
                        : "Select dd/mm/yyyy",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class DatePickerRangeMaterial extends StatelessWidget {
  const DatePickerRangeMaterial({
    super.key,
    required this.label,
    this.date,
    required this.onChangeDate,
    this.minDate,
    this.maxDate,
    this.radius,
    required this.locale,
  });

  final String label;
  final DateTimeRange? date;
  final Function(DateTimeRange) onChangeDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final double? radius;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    Future<void> selectDateRange(BuildContext context) async {
      DateTimeRange? picked = await showDateRangePickerCustom(
        context: context,
        locale: locale,
        initialDateRange: date,
        firstDate: DateTime.now().add(const Duration(days: -365)),
        lastDate: DateTime.now().add(const Duration(days: 365)),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      );

      if (picked != null) {
        onChangeDate(picked);
      }
    }

    return InkWell(
      onTap: () => selectDateRange(context),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff4f4f4),
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 8),
            ),
          ),
          labelStyle: ThemeData().textTheme.labelMedium,
          suffixIcon: Icon(
            Icons.calendar_month_rounded,
            color: ThemeData().primaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            date != null
                ? Text(
                    "${DateFormatThai.thaiDate(date?.start, locale.languageCode)} - ${DateFormatThai.thaiDate(date?.end, locale.languageCode)}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
                : Text(
                    locale.languageCode.contains('th')
                        ? "เลือก วว/ดด/ปป - วว/ดด/ปป"
                        : "Select dd/mm/yyyy - dd/mm/yyyy",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

final _datePickerStyle = MaterialRoundedDatePickerStyle(
  backgroundHeader: ThemeData().primaryColor,
  backgroundPicker: const Color(0xfff4f4f4),
  textStyleDayHeader: ThemeData().textTheme.bodyMedium,
  textStyleDayOnCalendar: ThemeData().textTheme.bodyMedium,
  textStyleYearButton: ThemeData().textTheme.bodyMedium,
  textStyleDayButton: ThemeData().textTheme.bodyMedium,
  textStyleMonthYearHeader: ThemeData().textTheme.titleLarge,
  paddingDatePicker: const EdgeInsets.all(8),
  decorationDateSelected: BoxDecoration(
    shape: BoxShape.circle,
    color: ThemeData().primaryColor,
  ),
  textStyleDayOnCalendarSelected: ThemeData().textTheme.bodyMedium,
  textStyleCurrentDayOnCalendar: ThemeData().textTheme.bodyMedium,
  textStyleButtonPositive: ThemeData().textTheme.bodyLarge,
  textStyleButtonNegative: ThemeData().textTheme.bodyLarge,
);

final _yearPickerStyle = MaterialRoundedYearPickerStyle(
  backgroundPicker: const Color(0xfff4f4f4),
  textStyleYear: const TextStyle(
    fontSize: 60,
  ),
  textStyleYearSelected: const TextStyle(
    fontSize: 60,
  ),
  heightYearRow: 100,
);
