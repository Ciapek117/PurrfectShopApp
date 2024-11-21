import 'package:purrfectshop_app/auth/auth_service.dart';
import 'package:purrfectshop_app/auth/login_screen.dart';
import 'package:purrfectshop_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:purrfectshop_app/widgets/navigation_bottom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      bottomNavigationBar: MyNavBarBottom(onTabChange: (value){},),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false, // This hides the back arrow
        title: Image.asset('images/goldCatText.png', color: Color(0xFF5F0F40),),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome users",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}


//CustomButton(
//               label: "Sign Out",
//               onPressed: () async {
//                 await auth.signout();
//                 goToLogin(context);
//               },
//             )
