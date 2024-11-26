import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final String imagePath;
  final double width;

  CustomTile({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.imagePath,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0), // Lepsza przestrzeń wokół
        child: Container(
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFD2AF43),
              width: 3,
              strokeAlign: 4
            ),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(5),
          child: Stack(
            children: [
              // Gradient background
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(color: backgroundColor.withOpacity(0.2))
                  ],
                  gradient: LinearGradient(
                    colors: [Colors.transparent, backgroundColor.withOpacity(0.6)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Centered Text
              Center(
                child: Text(
                  text,
                  style: GoogleFonts.bebasNeue(
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
