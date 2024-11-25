import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatImageScreen extends StatefulWidget {
  @override
  _CatImageScreenState createState() => _CatImageScreenState();
}

class _CatImageScreenState extends State<CatImageScreen> {
  List<String> images = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCatImage();
  }

  Future<void> getCatImage() async {
    try {
      List<String> tempImages = [];

      for (var i = 1; i <= 4; i++) {
        final doc = await FirebaseFirestore.instance
            .collection('catphotos')
            .doc('cat$i')
            .get();

        if (doc.exists) {
          tempImages.add(doc['imageUrl']);
        }
      }

      // Ustawienie danych i zakończenie ładowania
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
      children: images.map((img) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            img,
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
      body: createCatTile(),
    );
  }
}