import 'package:flutter/material.dart';
import 'package:purrfectshop_app/models/all_products.dart';
import 'package:purrfectshop_app/models/product.dart'; // Upewnij się, że zaimportowałeś model Product

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

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        items = allItems; // Jeśli brak zapytania, pokazujemy wszystkie produkty
      });
    } else {
      setState(() {
        // Filtrujemy produkty, które mają nazwę zawierającą wyszukiwaną frazę
        items = allItems.where((e) => e.name.toLowerCase().contains(query.toLowerCase())).toList();
      });
    }
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        bool localChecked = isChecked; // Lokalna zmienna do dialogu
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Filter Options"),
              content: Row(children: [ Checkbox(
                    value: localChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        localChecked = value!;
                      });
                    }),
                  Text("Enable filter")]),

              actions: [
                TextButton(
                  onPressed: () {Navigator.of(context).pop();},
                  child: Text("Cancel")),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isChecked = localChecked; // Zapisz zmiany globalnie
                    });
                    Navigator.of(context).pop(); // Zamknij dialog
                  },
                  child: Text("OK"))],
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

                    return Card(
                      child: Column(
                        children: [
                          Image.asset(item.imagePath), // Pokazujemy obrazek produktu
                          Text('Name: ${item.name}'),
                          Text('Price: \$${item.price}'),
                          const SizedBox(height: 8),
                          Text(item.description),
                        ],
                      ),
                    );
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
