import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:purrfectshop_app/auth/login_screen.dart';
import 'package:purrfectshop_app/pages/home_page.dart';
import 'package:purrfectshop_app/splash_screen.dart';

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

