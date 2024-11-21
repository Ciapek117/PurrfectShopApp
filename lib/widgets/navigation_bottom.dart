import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNavBarBottom extends StatefulWidget {
  MyNavBarBottom({super.key, required this.onTabChange});
  void Function(int)? onTabChange;

  @override
  State<MyNavBarBottom> createState() => _MyNavBarBottomState();
}

class _MyNavBarBottomState extends State<MyNavBarBottom> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: GNav(
          //tabBorder: Border(top: BorderSide(color: Color(0xFF5F0F40))),
          //backgroundColor: Color(0xFFD2AF43),
            color: Color(0xFF5F0F40),
            activeColor: Color(0xFFD2AF43),
            tabActiveBorder: Border.all(color: Color(0xFF5F0F40)),
            tabBackgroundColor: Color(0xFF5F0F40),
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            tabBorderRadius: 35,
            onTabChange: (value){
              setState(() {
                _selectedIndex = value;
              });

               return widget.onTabChange!(value);
            },
            tabs: [
              GButton(icon: Icons.shopping_bag_rounded, text: 'Cart', iconColor: Color(0xFF5F0F40),),
              GButton(
                icon: Icons.shopping_bag_rounded, // Placeholder icon (required)
                leading: Container(
                  child: Image.asset(
                      'images/catWithoutName.png', // Replace with your image path
                      width: 25,
                      height: 25,
                      fit: BoxFit.cover,
                      color: (_selectedIndex == 1) ? Color(0xFFD2AF43) : Color(0xFF5F0F40)
                  ),
                ),
                text: 'Home',
              ),
              GButton(icon: Icons.logout, text: 'Logout', iconColor: Color(0xFF5F0F40))
            ])
    );
  }
}
