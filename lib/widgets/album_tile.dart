import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purrfectshop_app/models/product.dart';

class AlbumTile extends StatelessWidget {
  final Product product;
  AlbumTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    void extendPicture() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                        child: Image.network(product.imagePath, fit: BoxFit.contain, width: double.infinity)),

                      const SizedBox(height: 10),

                      Text("\""+product.description+"\"", textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ))])),

                    actions: [
                      TextButton(
                        onPressed: () { Navigator.of(context).pop(); },
                        child: const Text("Cancel"))]);
          });
    }




    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD2AF43),
            borderRadius: BorderRadius.circular(25),
          ),

          child: Row(
            children: [
              GestureDetector(
                onTap: extendPicture,
                child: Tooltip(
                  message: "Click for description!",
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: const Border(right: BorderSide(color: Color(0xFF5F0F40), width: 4))
                    ),

                    height: 150,
                    width: 220,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(product.imagePath, fit: BoxFit.fill))),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                  const SizedBox(height: 2),

                  Text(product.name, style: GoogleFonts.kanit(textStyle: const TextStyle(
                    color: Color(0xFF5F0F40),
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ))),

                  const SizedBox(height: 2),

                  Text("Cena: " + product.price + " \$", style: GoogleFonts.kanit(textStyle: const TextStyle(
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
