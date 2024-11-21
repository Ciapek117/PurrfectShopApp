import 'package:purrfectshop_app/auth/auth_service.dart';
import 'package:purrfectshop_app/auth/login_screen.dart';
import 'package:purrfectshop_app/pages/home_page.dart';
import 'package:purrfectshop_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:purrfectshop_app/widgets/navigation_bottom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index){
      setState(() {
        _selectedIndex = index;
      });
  }

  final List<Widget> _pages = [
    const HomePage(),
    //const AlbumPage(),
    //const CartPage(),
    //const LogoutPage()
  ];


  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      bottomNavigationBar: MyNavBarBottom(onTabChange: (index) =>  navigateBottomBar(index)),
      backgroundColor: Color(0xFF5F0F40),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false, // This hides the back arrow
        title: Image.asset('images/goldCatText.png', color: Color(0xFFD2AF43)),
        backgroundColor: Colors.transparent,
      ),
      body: _pages[_selectedIndex],
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
