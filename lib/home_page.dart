
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'biodata_page.dart';
import 'calendar_page.dart';
import 'calculate_page.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 1;

  List<Widget> _pages = [
    CalculatePage(),
    CalendarPage(),
    BiodataPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('UTS Mobile')),
      ),
      body: SafeArea(child: _pages[_selectedPageIndex]),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedPageIndex,
        backgroundColor: Colors.white24,
        color: Colors.grey,
        items: const <Widget>[
          Icon(Icons.clear_all_outlined, color: Colors.white,),
          Icon(Icons.access_time_outlined, color: Colors.white,),
          Icon(Icons.account_circle_outlined, color: Colors.white,),
          Icon(Icons.logout_outlined, color: Colors.white,),

        ],
        onTap: (int index) {
          if (index == 3) {
            Logout();
          }else{
            setState(() {
              _selectedPageIndex = index;
            });
          }
        },
      ),
    );
  }

  void Logout() {
    Navigator.pushReplacementNamed(context, '/logout');
  }
}