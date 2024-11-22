import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final String imagePath;

  CustomTile({super.key, required this.backgroundColor, required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover)),

      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(7),
      child: Center(child: Text(text,style: GoogleFonts.bebasNeue(textStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        backgroundColor: backgroundColor,
        letterSpacing: 2,

      )))),
    );


  }
}
