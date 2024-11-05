# buddthist_date_time_and_date_picker

## Setup
 - flutter_rounded_date_picker : https://pub.dev/packages/flutter_rounded_date_picker

## Example 

### DateFormatThai Class

```dart
import 'package:flutter/material.dart';
import 'date_format_thai.dart'; // Make sure this is your file path

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DateFormatThaiExample(),
    );
  }
}

class DateFormatThaiExample extends StatelessWidget {
  final DateTime now = DateTime.now();
  final DateTime customDate = DateTime(2021, 11, 4, 14, 42); // Example date
  final DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2021, 11, 1),
    end: DateTime(2021, 11, 5),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thai Date Formatting Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Thai Full DateTime: ${DateFormatThai.thaiFullDateTime(now)}'),
            Text('Thai Full Date: ${DateFormatThai.thaiFullDate(customDate)}'),
            Text('Thai Date: ${DateFormatThai.thaiDate(customDate)}'),
            Text('Thai DateTime: ${DateFormatThai.thaiDateTime(customDate)}'),
            Text('Thai Month-Year: ${DateFormatThai.thaiMonthYear(customDate)}'),
            Text('Thai Short Date: ${DateFormatThai.thaiShortDate(customDate)}'),
            SizedBox(height: 20),
            Text('Converted Short DateTime: ${DateFormatThai.convertShortDateTime("04/Nov/2021")}'),
            Text('Converted Date Range: ${DateFormatThai.convertShortDateRange(dateRange)}'),
            Text('Time Range: ${DateFormatThai.convertShortTimeRange(TimeOfDay(hour: 14, minute: 30), TimeOfDay(hour: 16, minute: 45))}'),
            Text('Time Difference: ${DateFormatThai.findDateTimeDifference(DateTime(2023, 10, 5))}'),
          ],
        ),
      ),
    );
  }
}

```

### DatePickerMaterial Widget

```dart
import 'package:flutter/material.dart';
import 'date_picker_material.dart'; // Import the DatePickerMaterial class file
import 'date_format_thai.dart'; // Import the DateFormatThai class file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thai Date Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DatePickerScreen(),
    );
  }
}

class DatePickerScreen extends StatefulWidget {
  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime? selectedDate;

  void _onDateChanged(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thai Date Picker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DatePickerMaterial(
              label: 'Select Date',
              date: selectedDate,
              onChangeDate: _onDateChanged,
              minDate: DateTime(2020, 1, 1),
              maxDate: DateTime(2030, 12, 31),
              enable: true,
              locale: Locale('th', 'TH'), // For Thai calendar
            ),
            SizedBox(height: 20),
            Text(
              'Selected Date: ${selectedDate != null ? DateFormatThai.thaiDate(selectedDate) : 'No date selected'}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

```

### DatePickerRangeMaterial Widget

```dart
import 'package:flutter/material.dart';
import 'date_picker_range_material.dart'; // Import the DatePickerRangeMaterial class file
import 'date_format_thai.dart'; // Import the DateFormatThai class file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thai Date Range Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DateRangePickerScreen(),
    );
  }
}

class DateRangePickerScreen extends StatefulWidget {
  @override
  _DateRangePickerScreenState createState() => _DateRangePickerScreenState();
}

class _DateRangePickerScreenState extends State<DateRangePickerScreen> {
  DateTimeRange? selectedDateRange;

  void _onDateRangeChanged(DateTimeRange newDateRange) {
    setState(() {
      selectedDateRange = newDateRange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thai Date Range Picker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DatePickerRangeMaterial(
              label: 'Select Date Range',
              date: selectedDateRange,
              onChangeDate: _onDateRangeChanged,
              minDate: DateTime(2020, 1, 1),
              maxDate: DateTime(2030, 12, 31),
              radius: 12.0,
              locale: Locale('th', 'TH'), // Set to Thai locale for Buddhist calendar
            ),
            SizedBox(height: 20),
            Text(
              'Selected Date Range: ${selectedDateRange != null ? DateFormatThai.thaiDate(selectedDateRange!.start) + ' - ' + DateFormatThai.thaiDate(selectedDateRange!.end) : 'No date range selected'}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

```
