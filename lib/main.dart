import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:purrfectshop_app/auth/login_screen.dart';
import 'package:purrfectshop_app/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(), // Ustaw SplashScreen jako ekran początkowy

      routes: { //do przechodzenia szybciej miedzy stronami jak usuniesz zabije
        '/homepage' : (context) => HomePage()
      }
    );
  }
}

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