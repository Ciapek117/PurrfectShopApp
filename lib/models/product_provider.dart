import 'package:flutter/material.dart';
import 'package:purrfectshop_app/models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void setProducts(List<Product> products) {
    _products = products;
    notifyListeners(); // Powiadomienie o zmianach
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners(); // Powiadomienie o zmianach
  }
}
