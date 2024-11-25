import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatImageScreen extends StatefulWidget {
  @override
  _CatImageScreenState createState() => _CatImageScreenState();
}

class _CatImageScreenState extends State<CatImageScreen> {
  Map<String, Map<String, String>> images = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCatImage();
  }

  Future<void> getCatImage() async {
    try {
      Map<String, Map<String, String>> tempImages = {};

      // Pobieranie obrazków i wypełnianie słownika
      for (var i = 1; i <= 4; i++) {
        final docId = 'cat$i'; // Identyfikator dokumentu
        final doc = await FirebaseFirestore.instance
            .collection('catphotos')
            .doc(docId)
            .get();

        // Tymczasowa lista do ktorej wprowadzane sa dane
        if (doc.exists) {
          tempImages[docId] = {
            'description': doc['description'],
            'imageUrl': doc['imageUrl'],
            'name': doc['name'],
            'price': doc['price'],
            'tag': doc['tag'],
          };
        }
      }

      // Ustawienie danych do glownego slownika i zakończenie ładowania
      setState(() {
        images = tempImages;
        isLoading = false;
      });
    } catch (e) {
      print('Błąd podczas pobierania obrazów: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget createCatTile() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (images.isEmpty) {
      return Center(child: Text('Nie znaleziono obrazków.'));
    }

    return Column(
      children: images.entries.map((entry) {
        final docId = entry.key; // Identyfikator kotka
        final imgData = entry.value; // Dane obrazka (imageUrl, name itp.)

        final description = imgData['description'];
        final img = imgData['imageUrl'];
        final name = imgData['name'];
        final price = imgData['price'];
        final tag = imgData['tag'];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'ID: $docId',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Name: $name',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Description: $description',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'price: $price',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'tag: $tag',
                style: TextStyle(fontSize: 16),
              ),
              Image.network(
                img!,
                width: 100,
                height: 100,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return Text('Nie udało się załadować obrazu.');
                },
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Photo'),
      ),
      body: SingleChildScrollView(
        child: createCatTile(),
      ),
    );
  }
}