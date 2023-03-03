import 'package:flutter/material.dart';
import 'package:flutter_extiarbonne/pages/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.network(
              "https://cdn.dribbble.com/users/2973/screenshots/16945757/media/acf5d5a9edec6dcfd22e85b51fb929a1.png?compress=1&resize=400x300&vertical=top") //Image.asset('assets/images/fond.jpeg'),
          ),
    );
  }
}
