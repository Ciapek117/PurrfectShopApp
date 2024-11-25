import 'package:flutter/material.dart';
import 'package:purrfectshop_app/auth/login_screen.dart';
import 'package:purrfectshop_app/widgets/button.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          CustomButton(
              label: 'Log out',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              }),
          Spacer(),
        ],
      ),
    );
  }
}
