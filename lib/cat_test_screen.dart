import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatImageScreen extends StatefulWidget {
  @override
  _CatImageScreenState createState() => _CatImageScreenState();
}

class _CatImageScreenState extends State<CatImageScreen> {
  String? imageUrl;
  String? tag;

  @override
  void initState() {
    super.initState();
    fetchCatImage();
  }

  void fetchCatImage() async {
    try {
      print('Pobieranie danych z Firestore..');

      //Ustawia scierzke do konkretnego kota
      final doc = await FirebaseFirestore.instance
          .collection('catphotos')
          .doc('cat1')
          .get();

      if (doc.exists) {
        print('Dokument znaleziony: ${doc.data()}');
        setState(() {

          //Ustawia URL i Tag kota to zmiennych
          imageUrl = doc['imageUrl'];
          tag = doc['tag'];
        });
      } else {
        print('Dokument nie istnieje!');
      }
    } catch (e) {
      print('Błąd podczas pobierania danych: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Photo'),
      ),
      body: Center(
        child: Row(
          children: [
            imageUrl == null
                ? CircularProgressIndicator() // Pokazanie loadera w trakcie pobierania
                : Image.network( // Wyswietlanie obrazka pobranego z internetu
                  imageUrl!, width: 100, height: 100,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) { // Jezeli nastapi blad, wypisze ten text
                    return Text('Nie udało się załadować obrazu.');
              },
            ),
            Text('$tag')
          ],
        )
      ),
    );
  }
}
