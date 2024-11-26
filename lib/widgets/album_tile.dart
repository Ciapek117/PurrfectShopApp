import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purrfectshop_app/models/product.dart';

class AlbumTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  AlbumTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Funkcja powiększania zdjęcia w dialogu
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
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    child: Image.network(
                      product.imagePath,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\"${product.description}\"",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              ),
            ],
          );
        },
      );
    }

    // Główna struktura widgetu Tile
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
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
                      border: const Border(
                        right: BorderSide(color: Color(0xFF5F0F40), width: 4),
                      ),
                    ),
                    height: 150,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        product.imagePath,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 2),
                    Text(
                      product.name,
                      style: GoogleFonts.kanit(
                        textStyle: const TextStyle(
                          color: Color(0xFF5F0F40),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Cena: \n${product.price} \$",
                      style: GoogleFonts.kanit(
                        textStyle: const TextStyle(
                          color: Color(0xFF5F0F40),
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap, // Wywołanie przekazanej funkcji
                child: Container(
                  height: 150,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5F0F40),
                    border: Border.all(
                      color: const Color(0xFFD2AF43),
                      width: 3,
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Icon(
                    Icons.add_circle_outline,
                    color: Color(0xFFD2AF43),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
