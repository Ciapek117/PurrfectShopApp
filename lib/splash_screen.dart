import 'dart:async';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';

//SplashScreen DIY poniewaz wtyczka nie dziala
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool moveUp = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), ()
    {
      setState(() {
      moveUp = true;
      });
      Future.delayed(const Duration(seconds: 1), _navigateToLogin);
    });
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F0F40),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: moveUp ? 0 :  MediaQuery.of(context).size.height / 2 - 200,
            left: MediaQuery.of(context).size.width / 2 - 150,
            child:  Image.asset(
              'images/logoCatGold.png', // Ścieżka do obrazka
              fit: BoxFit.cover, // Dopasowanie obrazu
              height: 300,
              width: 300,
            ),
          )
        ],
      ),
    );
  }
}