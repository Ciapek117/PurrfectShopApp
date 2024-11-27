import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:google_fonts/google_fonts.dart';

class GifTile extends StatelessWidget {
  final String gifPath; // Zmieniono nazwę dla czytelności
  final double width;

  GifTile({
    super.key,
    required this.gifPath,
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
            strokeAlign: 4,
          ),

          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 4))],
        ),

        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(gifPath,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity))),
      ),
    );
  }
}
