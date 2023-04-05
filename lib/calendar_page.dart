import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendar_table_page.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
  String _currentDate = DateFormat('EEE, dd MMM yyyy').format(DateTime.now());

  String _selectedZone = 'WIB';
  int _zoneDifference = 0;

  DateTime today = DateTime.now();
  DateTime _selectedDate = DateTime.now();


  @override
  void initState() {
    super.initState();

    // Update current time every second
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateCurrentTime());
  }

  void _updateCurrentTime() {
    var now = DateTime.now().add(Duration(hours: _zoneDifference));
    if (now.month == _selectedDate.month) {
      setState(() {
        _currentTime = DateFormat('HH:mm:ss').format(now);
      });
    }
  }


  void _onZoneChanged(String value) {
    setState(() {
      _selectedZone = value;

      switch (value) {
        case 'WIB':
          _zoneDifference = 0;
          break;
        case 'WITA':
          _zoneDifference = 1;
          break;
        case 'WIT':
          _zoneDifference = 2;
          break;
        default:
          _zoneDifference = 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarTablePage()),
                );
              },
              child: Text('Go to Calendar Table'),
            ),
            SizedBox(height: 16),
            Text(
              _currentDate,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 16),
            Text(
              _currentTime,
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Zone: '),
                DropdownButton<String>(
                  value: _selectedZone,
                  items: [
                    DropdownMenuItem(child: Text('WIB'), value: 'WIB'),
                    DropdownMenuItem(child: Text('WITA'), value: 'WITA'),
                    DropdownMenuItem(child: Text('WIT'), value: 'WIT'),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedZone = value!;
                    });
                    _onZoneChanged(value!);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}