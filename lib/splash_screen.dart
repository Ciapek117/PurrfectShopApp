import 'dart:async';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';

//SplashScreen DIY bo wtyczka nie dziala
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    // Przejście do ekranu logowania po 2 sekundach
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F0F40),
      body: Center(
        child: Image.asset(
          'images/logoCatGold.png', // Ścieżka do obrazka
          fit: BoxFit.cover, // Dopasowanie obrazu
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}