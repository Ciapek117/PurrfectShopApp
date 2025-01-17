import 'dart:developer';

import 'package:purrfectshop_app/auth/auth_service.dart';
import 'package:purrfectshop_app/auth/signup_screen.dart';
import 'package:purrfectshop_app/home_screen.dart';
import 'package:purrfectshop_app/widgets/button.dart';
import 'package:purrfectshop_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF5F0F40),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Image.asset('images/logoCatGold.png', fit: BoxFit.cover, height: 300,),
            const Text("Login ",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Color(0xFFD2AF43)),
                textAlign: TextAlign.left,
            ),
            const SizedBox(height: 25),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: _email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              controller: _password,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Login",
              onPressed: _login,
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 30),
               const Text("Don't have an account yet? ", style: TextStyle(color: Colors.white),),
              InkWell(
                onTap: () => goToSignup(context),
                child:
                    const Text("Signup", style: TextStyle(color: Color(0xFFD2AF43))),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.pushNamed(context, '/signuppage');

  goToHome(BuildContext context) => Navigator.pushNamed(context, '/homescreen');

  Future _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      // Jeśli użytkownik się zalogował, przechodzimy do strony głównej
      log("User Logged In");
      goToHome(context);
    } else {
      // Jeśli login lub hasło są błędne, pokazujemy AlertDialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Błąd podczas logowania'),
            content: const Text('Błędny login lub hasło'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Zamknięcie dialogu
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
