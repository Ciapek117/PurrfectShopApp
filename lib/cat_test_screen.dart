import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatImageScreen extends StatefulWidget {
  @override
  _CatImageScreenState createState() => _CatImageScreenState();
}

class _CatImageScreenState extends State<CatImageScreen> {
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    fetchCatImage();
  }

  void fetchCatImage() async {
    try {
      // Pobierz dokument `cat1` z kolekcji `catphotos`
      final doc = await FirebaseFirestore.instance
          .collection('catphotos')
          .doc('cat1')
          .get();

      if (doc.exists) {
        setState(() {
          imageUrl = doc['imageUrl']; // Pobranie URL z pola `imageUrl`
        });
      } else {
        print('Dokument nie istnieje!');
      }
    } catch (e) {
      print('Błąd: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Photo'),
      ),
      body: Center(
        child: imageUrl == null
            ? CircularProgressIndicator() // Pokazanie loadera w trakcie pobierania
            : Image.network(
          imageUrl!,
            errorBuilder: (context, error, stackTrace) => Text('Nie udało się załadować obrazu'),
        ),
      ),
    );
  }
}
