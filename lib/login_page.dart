import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:prak_tpm_3/home_screen.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences _prefs;
  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _showImage(),
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          setState(() {
            username = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: (isLoginSuccess) ? Colors.deepPurple : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: (isLoginSuccess) ? Colors.deepPurple : Colors.red),
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    String text = "";
    if (password == "rakha123") {
      setState(() {
        text = "Login Success";
        isLoginSuccess = true;
      });
      await _prefs.setBool('isLoggedIn', true); // Store login status
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );

      final player = AudioPlayer();
      await player.play(AssetSource('zeta1.mp3'));
    } else {
      setState(() {
        text = "Login Failed";
        isLoginSuccess = false;
      });
      final player = AudioPlayer();
      await player.play(AssetSource('zetaa.mpeg'));
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.grey : Colors.red,
          onPrimary: Colors.white,
        ),
        onPressed: () => _login(context),
        child: const Text('Login'),
      ),
    );
  }

  Widget _showImage() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: ClipOval(
        child: Image.asset(
          'zeta.jpg',
          height: 250,
          width: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
