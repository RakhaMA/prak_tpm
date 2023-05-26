import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'blink.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background/genshin-impact-07.jpg',),
                fit: BoxFit.cover,
              )
          ),

          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 45.0),
                  child: BlinkingText('Klik Disini'),
                ),
                //Text('Tap to Enter', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white,), ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

