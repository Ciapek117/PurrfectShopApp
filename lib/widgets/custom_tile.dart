import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: Color(0xFFD2AF43),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(7),
      child: Stack(
        children: [
          //Image.asset('images/imagesForTiles/kot1.jpg')
        ],
      ),
    );

  }
}
