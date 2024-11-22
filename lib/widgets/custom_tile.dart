import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('-50% OFF!', )),//style: GoogleFonts.,)),
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('images/images_for_tiles/kot1.jpg'),
          fit: BoxFit.cover)),

      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(7),
    );


  }
}
