import 'package:buddthist_date_time/buddthist_date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';

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
  });

  final String label;
  final DateTime? date;
  final Function(DateTime) onChangeDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    void showPicker() async {
      DateTime? picked = await showRoundedDatePicker(
        context: context,
        locale: Intl.getCurrentLocale().contains('th')
            ? const Locale('th', 'TH')
            : const Locale('en', 'US'),
        era: Intl.getCurrentLocale().contains('th')
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
          fillColor: const Color(0xFFBDBDBD),
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
                : const Color(0xFFBDBDBD),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            date != null
                ? Text(
                    DateFormatThai.thaiDate(date),
                    style: ThemeData().textTheme.bodyMedium,
                  )
                : Text(
                    Intl.getCurrentLocale().contains('th')
                        ? "เลือก วว/ดด/ปป"
                        : "Select dd/mm/yyyy",
                    style: ThemeData().textTheme.bodyMedium,
                  )
          ],
        ),
      ),
    );
  }
}

class DatePickerRangeThaiMaterial extends StatelessWidget {
  const DatePickerRangeThaiMaterial({
    super.key,
    required this.label,
    this.date,
    required this.onChangeDate,
    this.minDate,
    this.maxDate,
    this.radius,
  });

  final String label;
  final DateTimeRange? date;
  final Function(DateTimeRange) onChangeDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    Future<void> selectDateRange(BuildContext context) async {
      DateTimeRange? picked = await showDateRangePickerCustom(
        context: context,
        locale: Intl.getCurrentLocale().contains('th')
            ? const Locale('th', 'TH')
            : const Locale('en', 'US'),
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
          fillColor: const Color(0xFFBDBDBD),
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
                    "${DateFormatThai.thaiDate(date?.start)} - ${DateFormatThai.thaiDate(date?.end)}",
                    style: ThemeData().textTheme.bodyMedium,
                  )
                : Text(
                    Intl.getCurrentLocale().contains('th')
                        ? "เลือก วว/ดด/ปป - วว/ดด/ปป"
                        : "Select dd/mm/yyyy - dd/mm/yyyy",
                    style: ThemeData().textTheme.bodyMedium,
                  )
          ],
        ),
      ),
    );
  }
}

final _datePickerStyle = MaterialRoundedDatePickerStyle(
  backgroundHeader: ThemeData().primaryColor,
  backgroundPicker: const Color(0xFFBDBDBD),
  textStyleDayHeader: ThemeData().textTheme.bodyMedium,
  textStyleDayOnCalendar: ThemeData().textTheme.bodyMedium,
  textStyleYearButton: ThemeData().textTheme.bodyMedium,
  textStyleDayButton: ThemeData().textTheme.bodyMedium,
  textStyleMonthYearHeader: ThemeData().textTheme.bodyMedium,
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
  backgroundPicker: const Color(0xFFBDBDBD),
  textStyleYear: ThemeData().textTheme.headlineLarge,
  textStyleYearSelected: ThemeData().textTheme.headlineLarge,
  heightYearRow: 100,
);
