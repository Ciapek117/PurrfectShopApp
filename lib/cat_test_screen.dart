import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'models/product.dart';
import 'models/product_provider.dart';

class CatImageScreen extends StatefulWidget {
  @override
  _CatImageScreenState createState() => _CatImageScreenState();
}

class _CatImageScreenState extends State<CatImageScreen> {
  List<Product> allProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  // Funkcja do ładowania produktów z Firestore
  Future<void> _loadProducts() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('catphotos') // Zmienna kolekcji, sprawdź jej nazwę
          .get();

      // Jeżeli dane są pobrane, ustawiamy stan
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          allProducts = snapshot.docs
              .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
              .toList();

          Provider.of<ProductProvider>(context, listen: false).setProducts(allProducts);
          isLoading = false;
        });
      } else {
        // Jeśli nie ma danych, również ustawiamy flagę isLoading na false
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      // Obsługa błędów w przypadku problemów z połączeniem z Firestore
      setState(() {
        isLoading = false;
      });
      print("Błąd podczas pobierania produktów: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

