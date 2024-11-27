import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:purrfectshop_app/models/product.dart';
import '../models/cart.dart';

class CartItem extends StatefulWidget {
  final Product cat;
  final int quantity; // Ilość produktu
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    required this.cat,
    required this.quantity,
    required this.onRemove,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.5, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> removeCatFromCart() async {
    if (widget.quantity > 1) {
      widget.onRemove();
    } else {
      await _animationController.forward();
      widget.onRemove();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Przekonwertuj cenę z String na double
    double productPrice = double.tryParse(widget.cat.price) ?? 0.0; // Jeśli nie uda się przekonwertować, ustawi wartość na 0.0

    // Oblicz sumę na podstawie quantity i ceny
    double totalPrice = productPrice * widget.quantity;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD2AF43),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              // Obraz
              Tooltip(
                message: "Click for description!",
                child: Container(
                  height: 110,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      widget.cat.imagePath,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Dane produktu
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cat.name,
                      style: GoogleFonts.kanit(
                        textStyle: const TextStyle(
                          color: Color(0xFF5F0F40),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Quantity: ${widget.quantity}",
                      style: GoogleFonts.kanit(
                        textStyle: const TextStyle(
                          color: Color(0xFF5F0F40),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "$totalPrice \$", // Używamy przekonwertowanej ceny
                      style: GoogleFonts.kanit(
                        textStyle: const TextStyle(
                          color: Color(0xFF5F0F40),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Usuwanie produktu
              GestureDetector(
                onTap: removeCatFromCart,
                child: Container(
                  height: 110,
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
