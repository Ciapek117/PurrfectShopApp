import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:purrfectshop_app/models/product.dart';

import '../models/cart.dart';
import '../widgets/cart_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        // Pobierz listę produktów w koszyku
        var cartItems = value.getUserCart();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Text(
                'My cart',
                style: GoogleFonts.b612(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color(0xFFD2AF43),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    final product = cartItem.key;
                    final quantity = cartItem.value;

                    return CartItem(
                      key: ValueKey(product),  // Unikalny klucz
                      cat: product,
                      quantity: quantity,
                      onRemove: () {
                        Provider.of<Cart>(context, listen: false).removeItemFromCart(product);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
