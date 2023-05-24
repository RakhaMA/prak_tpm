import 'package:flutter/material.dart';
import 'listproduct.dart';


class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _showUsername(),
            SizedBox(height: 20),
            _buildMenu(),
          ],
        ),
      ),
    );
  }

  Widget _showUsername() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Welcome ${widget.username}',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Column(
      children: [
        _buildMenuItem(
          'Groceries List',
          'Go to Groceries List Page',
              () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListProduct()),
          ),
        ),
        // _buildMenuItem(
        //   'Menu Item 3',
        //   'This is menu item 3',
        //       () => {},
        // ),
      ],
    );
  }

  Widget _buildMenuItem(String title, String subtitle, Function onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () => onPressed(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
