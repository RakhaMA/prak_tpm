import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTablePage extends StatefulWidget {
  const CalendarTablePage({Key? key}) : super(key: key);

  @override
  _CalendarTablePageState createState() => _CalendarTablePageState();
}

class _CalendarTablePageState extends State<CalendarTablePage> {
  DateTime today = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Table'),
      ),
      body: Container(
        child: TableCalendar(
          locale: "en_US",
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          selectedDayPredicate: (date) => isSameDay(_selectedDate, date),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDate = selectedDay;
            });
          },
        ),
      ),
    );
  }
}
