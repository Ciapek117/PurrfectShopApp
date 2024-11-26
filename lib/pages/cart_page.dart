import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Text('Moj koszyk', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,),
          ),
          
          const SizedBox(height: 10,)

        ],
      ),
    ),
    );
  }
}
