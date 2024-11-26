import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:purrfectshop_app/auth/login_screen.dart';
import 'package:purrfectshop_app/auth/signup_screen.dart';
import 'package:purrfectshop_app/home_screen.dart';
import 'package:purrfectshop_app/models/cart.dart';
import 'package:purrfectshop_app/splash_screen.dart';

import 'models/product_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Cart(),
        builder: (context, child) =>  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: SplashScreen(), // Ustaw SplashScreen jako ekran początkowy

            routes: { //do przechodzenia szybciej miedzy stronami jak usuniesz zabije
              '/homescreen' : (context) => HomeScreen(),
              '/loginpage' : (context) => LoginScreen(),
              '/signuppage' : (context) => SignupScreen()
            }
        )
    );
  }
}

