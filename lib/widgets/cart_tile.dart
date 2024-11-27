import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:purrfectshop_app/models/product.dart';

import '../models/cart.dart';

class CartItem extends StatefulWidget {
  Product cat;
  CartItem({
    super.key,
    required this.cat
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  //TODO: Bardzo opcjonalne dodaj animacje usuniecia

  // Usuwanie kota z koszyka
  void removeCatFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.cat);
  }

  @override
  Widget build(BuildContext context) {
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
                child: Tooltip(
                  message: "Click for description!",
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: const Border(
                        right: BorderSide(color: Color(0xFF5F0F40), width: 4),
                      ),
                    ),
                    height: 100,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        widget.cat.imagePath,
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
                      widget.cat.name,
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
                        "${widget.cat.price} \$",
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
                onTap: removeCatFromCart, // Wywołanie przekazanej funkcji
                child: Container(
                  height: 100,
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
                    Icons.delete,
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
    /*
    return Container(
      decoration: BoxDecoration(color: Color(0xFFD2AF43),borderRadius: BorderRadius.circular(10),),
        margin: EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Opcjonalne zaokrąglenie
            child: Container(
              width: 100, // Szerokość obszaru leading
              height: double.infinity, // Wysokość dostosowana do całego elementu
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.cat.imagePath),
                  fit: BoxFit.cover, // Dopasowanie obrazu do całego kontenera
                ),
              ),
            ),
          ),
          title: Text(widget.cat.name, style: GoogleFonts.kanit( color: Color(0xFF5F0F40)), ),
          subtitle: Text(
            '${widget.cat.price} \$',
            style: const TextStyle(color: Color(0xFF5F0F40), fontWeight: FontWeight.bold),
          ),
          trailing: GestureDetector(
            onTap: removeCatFromCart, // Wywołanie przekazanej funkcji
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
          ),
        );

     */
  }
}
