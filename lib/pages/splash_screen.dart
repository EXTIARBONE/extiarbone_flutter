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
              "https://img.freepik.com/premium-vector/green-ecology-logo-design-world-environment_569344-380.jpg?w=2000") //Image.asset('assets/images/fond.jpeg'),
          ),
    );
  }
}
