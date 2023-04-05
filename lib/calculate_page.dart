import 'dart:math';

import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Shape'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrapesiumCalculator()),
                );
              },
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: ClipOval(
                              child: Image.asset('zeta2.jpg', height: 50, width: 50, fit: BoxFit.cover,)
                          )
                      ),
                      SizedBox(height: 16),
                      Text('Trapesium'),
                    ],),

                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CylinderCalculator()),
                );
              },
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: ClipOval(
                                child: Image.asset('zeta3.jpg', height: 50, width: 50, fit: BoxFit.cover,)
                            )
                        ),
                        SizedBox(height: 16),
                        Text('Tabung'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TrapesiumCalculator extends StatefulWidget {
  @override
  _TrapesiumCalculatorState createState() => _TrapesiumCalculatorState();
}

class _TrapesiumCalculatorState extends State<TrapesiumCalculator> {
  double _sisiAtas = 0.0;
  double _sisiBawah = 0.0;
  double _tinggi = 0.0;
  double _luasTrapesium = 0.0;
  double _kelilingTrapesium = 0.0;

  void _calculate() {
    setState(() {
      _luasTrapesium = (_sisiAtas + _sisiBawah) * _tinggi / 2;
      _kelilingTrapesium = _sisiAtas + _sisiBawah + 2 * (sqrt(pow((_sisiBawah - _sisiAtas) / 2, 2) + pow(_tinggi, 2)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trapesium Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sisi Atas',
              ),
              onChanged: (value) {
                setState(() {
                  _sisiAtas = double.parse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sisi Bawah',
              ),
              onChanged: (value) {
                setState(() {
                  _sisiBawah = double.parse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi',
              ),
              onChanged: (value) {
                setState(() {
                  _tinggi = double.parse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Hitung'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Luas: $_luasTrapesium',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Keliling: $_kelilingTrapesium',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}


class CylinderCalculator extends StatefulWidget {
  @override
  _CylinderCalculatorState createState() => _CylinderCalculatorState();
}

class _CylinderCalculatorState extends State<CylinderCalculator> {
  late TextEditingController _radiusController;
  late TextEditingController _heightController;
  double _resultSurfaceArea = 0;
  double _resultVolume = 0;

  @override
  void initState() {
    super.initState();
    _radiusController = TextEditingController();
    _heightController = TextEditingController();
  }

  @override
  void dispose() {
    _radiusController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _calculate() {
    double radius = double.parse(_radiusController.text);
    double height = double.parse(_heightController.text);

    setState(() {
      _resultSurfaceArea = 2 * pi * radius * (radius + height);
      _resultVolume = pi * radius * radius * height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabung Calculator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _radiusController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jari-jari (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _calculate,
                child: Text('Hitung'),
              ),
              SizedBox(height: 32.0),
              Text(
                'Luas Permukaan: $_resultSurfaceArea cm²',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16.0),
              Text(
                'Volume: $_resultVolume cm³',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}