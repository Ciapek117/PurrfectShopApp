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
          trailing: IconButton( //TODO Zmien na taki jak dodawanie tylko usuwanie
              icon:  Icon(Icons.delete),
              onPressed: removeCatFromCart, // Funkcja usuwa kota z koszyka
          ),
        )
    );

  }
}
