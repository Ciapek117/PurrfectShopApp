import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNavBarBottom extends StatefulWidget {
  const MyNavBarBottom({super.key, required this.onTabChange});
  final void Function(int)? onTabChange;

  @override
  State<MyNavBarBottom> createState() => _MyNavBarBottomState();
}

class _MyNavBarBottomState extends State<MyNavBarBottom> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GNav(
            tabBorder: Border(
                top: BorderSide(color: Color(0xFFD2AF43), width: 3, strokeAlign: 3),
                bottom: BorderSide(color: Color(0xFFD2AF43), width: 3, strokeAlign: 3),
                left: BorderSide(color: Color(0xFFD2AF43), width: 3, strokeAlign: 3),
                right: BorderSide(color: Color(0xFFD2AF43), width: 3, strokeAlign: 3)
            ),
          //backgroundColor: Color(0xFFD2AF43),
            color: const Color(0xFFD2AF43),
            activeColor: const Color(0xFF5F0F40),
            tabActiveBorder: Border.all(color: const Color(0xFFD2AF43), strokeAlign: 3, width: 3),
            tabBackgroundColor: const Color(0xFFD2AF43),
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            tabBorderRadius: 35,
            onTabChange: (value){
              setState(() {
                _selectedIndex = value;
              });

               return widget.onTabChange!(value);
            },
            tabs: [
              GButton(
                icon: Icons.shopping_bag_rounded, // Placeholder icon (required)
                leading: Container(
                    child: Image.asset(
                        'images/catWithoutName.png', // Replace with your image path
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                        color: (_selectedIndex == 0) ? const Color(0xFF5F0F40) : const Color(0xFFD2AF43)
                    ),
                  ),
                text: 'Home', textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color:Color(0xFF5F0F40,)),
              ),


              const GButton(icon: Icons.photo, text: 'Album', iconColor: Color(0xFFD2AF43), textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color:Color(0xFF5F0F40) )),

              const GButton(icon: Icons.shopping_bag_rounded, text: 'Cart',iconColor: Color(0xFFD2AF43), textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color:Color(0xFF5F0F40) )),

              const GButton(icon: Icons.settings, text: 'Settings', iconColor: Color(0xFFD2AF43), textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color:Color(0xFF5F0F40) ))
            ])
    );
  }
}
