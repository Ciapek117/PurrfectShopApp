import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final String imagePath;
  final double width;

  CustomTile({super.key, required this.backgroundColor, required this.text, required this.imagePath, required this.width});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBorder(
      gradientColors: [
        Color(0xFFD2AF43),
        Colors.transparent,
        Colors.transparent,
        Color(0xFFD2AF43),
      ],

      glowSize: 1,
      borderRadius: BorderRadius.circular(30),

      child: Padding(
        padding: const EdgeInsets.all(0.001),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
        ),
      ),
    );

  }
}
