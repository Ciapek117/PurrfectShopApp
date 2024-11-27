import 'package:flutter/material.dart';
import 'package:purrfectshop_app/models/product.dart';
import 'package:purrfectshop_app/models/all_products.dart';

class Cart extends ChangeNotifier {
  final Map<Product, int> _userCart = {};

  // Pobierz koszyk jako lista produktów
  List<MapEntry<Product, int>> getUserCart() {
    return _userCart.entries.toList();
  }

  // Dodaj produkt do koszyka
  void addItemToCart(Product product) {
    if (_userCart.containsKey(product)) {
      _userCart[product] = _userCart[product]! + 1;
    } else {
      _userCart[product] = 1;
    }
    notifyListeners();
  }

  // Usuń produkt z koszyka
  void removeItemFromCart(Product product) {
    if (_userCart.containsKey(product)) {
      if (_userCart[product]! > 1) {
        _userCart[product] = _userCart[product]! - 1;
      } else {
        _userCart.remove(product);
      }
      notifyListeners();
    }
  }

  // Oblicz łączną wartość koszyka
  double get totalAmount {
    double total = 0.0;
    _userCart.forEach((product, quantity) {
      total += double.tryParse(product.price) ?? 0 * quantity;
    });
    return total;
  }
}
