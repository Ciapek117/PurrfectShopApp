import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purrfectshop_app/models/product.dart';

class AlbumTile extends StatelessWidget {
  final Product product;
  AlbumTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD2AF43),
            borderRadius: BorderRadius.circular(25),
          ),

          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border(right: BorderSide(color: Color(0xFF5F0F40), width: 4))
                ),

                height: 150,
                width: 220,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(product.imagePath, fit: BoxFit.fill))),

              const SizedBox(width: 10),

              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                  const SizedBox(height: 2),

                  Text(product.name, style: GoogleFonts.kanit(textStyle: TextStyle(
                    color: Color(0xFF5F0F40),
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ))),

                  const SizedBox(height: 2),

                  Text("Cena: " + product.price + " \$", style: GoogleFonts.kanit(textStyle: TextStyle(
                    color: Color(0xFF5F0F40),
                    letterSpacing: 1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  )))])),
            ],
          ),

      )),
    );
  }
}
