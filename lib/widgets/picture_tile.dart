import 'package:flutter/material.dart';

class PictureTile extends StatelessWidget {
  final double width;
  final String imagePath;
  final Color color;
  final String text;

  const PictureTile({
    super.key,
    required this.width,
    required this.imagePath,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(12),
          child: Stack(
            children: [
              // Obraz
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(imagePath, fit: BoxFit.cover, width: double.infinity, height: double.infinity)),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent,color.withOpacity(0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(20))),

              Positioned(bottom: 10, left: 0, right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter, // Wyrównuje tekst do środka poziomo
                  child: Text(text,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18,))))]
          )));
  }
}
