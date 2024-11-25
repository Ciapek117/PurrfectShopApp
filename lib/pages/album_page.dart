import 'package:flutter/material.dart';
import 'package:purrfectshop_app/models/all_products.dart';
import 'package:purrfectshop_app/models/product.dart';

import '../widgets/album_tile.dart'; // Upewnij się, że zaimportowałeś model Product

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
    allItems = allProducts.getProductList(); // Pobieramy listę produktów
    items = allItems; // Początkowo wyświetlamy wszystkie produkty
    searchController.addListener(queryListener);
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
        // Filtruj produkty po nazwie
        items = allItems.where((e) => e.name.toLowerCase().contains(query.toLowerCase())).toList();
      });
    } else if (query is Tags) {
      setState(() {
        // Filtruj produkty po tagu
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
                          }),

                        Text(tagName),
                      ]);
                  }))),

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Zamknij dialog bez zmian
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    for (int i = 0; i < localFilterStates.length; i++) {
                      if (localFilterStates[i]) {
                        // Przekaż obiekt Tags do search
                        search(uniqueTags[i]);
                      }}
                    Navigator.of(context).pop();
                  },

                  child: Text("OK"))]);
          });
      });
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
