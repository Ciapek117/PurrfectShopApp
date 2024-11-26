import 'package:flutter/material.dart';
import 'package:purrfectshop_app/models/product.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFD2AF43)),
        margin: EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Image.network(widget.cat.imagePath, fit: BoxFit.fill,width: 60, height: 100,),
          title: Text(widget.cat.name),
          subtitle: Text(widget.cat.price),
        )
    );

  }
}
