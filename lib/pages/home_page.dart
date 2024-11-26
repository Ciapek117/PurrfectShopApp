import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import '../models/product.dart';
import '../widgets/custom_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('catgifs') // Twoja kolekcja produktów
          .get();

      if (snapshot.docs.isNotEmpty) {
        List<String> paths = snapshot.docs.map((doc) => doc['gifPath'] as String).toList();
        print(paths);
      } else {
        print("Brak produktów w kolekcji.");
      }
    } catch (e) {
      print("Błąd podczas ładowania produktów: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F0F40),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: SizedBox(
                  height: 130,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CustomTile(
                        backgroundColor: Color(0xFF61ccee).withOpacity(0.5),
                        text: '-50% OFF!',
                        imagePath: 'images/images_for_tiles/kot1.jpg',
                        width: 220,
                    ))),
            ),

            const SizedBox(height: 5),


            //TODO: zrobic jednego tile'a, ktory bedzie mial przykladowo 7 gifow z firebase'a
            //TODO: za pomoca duration zmieniac te gify w kolko (np. co 3sek)

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: SizedBox(
                  height: 450,
                  child: ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CustomTile(
                        backgroundColor: Color(0xFF61ccee).withOpacity(0.5),
                        text: '-50% OFF!',
                        imagePath: 'images/images_for_tiles/kot1.jpg',
                        width: 350,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
