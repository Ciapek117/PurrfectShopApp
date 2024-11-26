import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purrfectshop_app/models/all_products.dart';
import 'package:purrfectshop_app/models/product.dart';

import '../widgets/album_tile.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late AllProducts allProducts;

  var allItems = [];
  var items = [];
  final TextEditingController searchController = TextEditingController();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    allProducts = AllProducts(); // Inicjalizujemy AllProducts
    _loadProducts(); // Ładujemy produkty z Firestore
    searchController.addListener(queryListener);
  }

  // Funkcja do ładowania produktów z Firestore
  Future<void> _loadProducts() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('catphotos') // Twoja kolekcja produktów
          .get();

      if (snapshot.docs.isNotEmpty) {
        List<Product> products = snapshot.docs
            .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
            .toList();

        // Przypisujemy pobrane produkty do AllProducts
        setState(() {
          allProducts.setProducts(products);
          allItems = products; // Ustawiamy początkowe dane
          items = allItems; // Wyświetlamy wszystkie produkty
        });
      } else {
        setState(() {
          items = [];
        });
      }
    } catch (e) {
      setState(() {
        items = [];
      });
      print("Błąd podczas pobierania produktów: $e");
    }
  }

  @override
  void dispose() {
    searchController.removeListener(queryListener);
    searchController.dispose();
    super.dispose();
  }

  void queryListener() {
    search(searchController.text);
  }

  void search(dynamic query) {
    if (query is String && query.isNotEmpty) {
      setState(() {
        items = allItems.where((e) => e.name.toLowerCase().contains(query.toLowerCase())).toList();
      });
    } else if (query is Tags) {
      setState(() {
        items = allItems.where((e) => e.tags == query).toList();
      });
    } else {
      setState(() {
        items = allItems; // Jeśli brak zapytania, pokaż wszystkie produkty
      });
    }
  }

  void _showFilterDialog() {
    List<Tags> uniqueTags = allProducts.getUniqueTags(); // Pobierz unikalne tagi
    List<bool> localFilterStates = List.generate(uniqueTags.length, (index) => false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Filter Options"),
              content: SingleChildScrollView(
                child: Column(
                  children: List.generate(uniqueTags.length, (index) {
                    String tagName = uniqueTags[index].toString().split('.').last;
                    return Row(
                      children: [
                        Checkbox(
                          value: localFilterStates[index],
                          onChanged: (bool? value) {
                            setState(() {
                              localFilterStates[index] = value ?? false;
                            });
                          },
                        ),
                        Text(tagName),
                      ],
                    );
                  }),
                ),
              ),
              actions: [
                // Przycisk Cancel
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Zamknij dialog bez zmian
                  },
                  child: Text("Cancel"),
                ),
                // Przycisk OK
                TextButton(
                  onPressed: () {
                    // Przekazanie zaznaczonych tagów do funkcji search
                    for (int i = 0; i < localFilterStates.length; i++) {
                      if (localFilterStates[i]) {
                        // Jeśli tag jest zaznaczony, filtruj według niego
                        search(uniqueTags[i]);
                      }
                    }
                    Navigator.of(context).pop(); // Zamknij dialog po zastosowaniu filtra
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F0F40),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
          child: Column(
            children: <Widget>[
              SearchBar(
                  controller: searchController,
                  hintText: 'Search..',
                  trailing: [IconButton(
                      onPressed: _showFilterDialog,
                      icon: Icon(Icons.filter_alt, color: Color(0xFF5F0F40)))],
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Color(0xFF5F0F40), size: 30))),

              Expanded(
                child: ListView.builder(
                  itemCount: items.isEmpty ? allItems.length : items.length,
                  itemBuilder: (context, index) {
                    final item = items.isEmpty ? allItems[index] : items[index];
                    return AlbumTile(product: item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
