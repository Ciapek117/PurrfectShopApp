import 'dart:async';

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
  List<String> paths = [];
  int currentGifIndex = 0;
  Timer? gifTimer;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  void dispose() {
    gifTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadProducts() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('catgifs') // Twoja kolekcja produktów
          .get();

      if (snapshot.docs.isNotEmpty) {
        List<String> _paths = snapshot.docs.map((doc) => doc['gifPath'] as String).toList();


        setState(() {
          paths = _paths;
        });

        print("${paths.length} ILOSC LINKOW W DOCS!");
        startGifRotation();

      } else {
        print("Brak produktów w kolekcji.");
      }
    } catch (e) {
      print("Błąd podczas ładowania produktów: $e");
    }
  }

  void startGifRotation(){
    if(paths.isEmpty) return;

    gifTimer = Timer.periodic(const Duration(seconds: 4), (timer){
      setState(() {
        currentGifIndex = (currentGifIndex + 1) % paths.length;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F0F40),
      body: SingleChildScrollView(
        child: Column(
          children:[
            const SizedBox(height: 25),


            //TODO: zrobic jednego tile'a, ktory bedzie mial przykladowo 7 gifow z firebase'a
            //TODO: za pomoca duration zmieniac te gify w kolko (np. co 3sek)

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: SizedBox(
                  height: 450,
                  child: CustomTile(
                    backgroundColor: Color(0xFF61ccee).withOpacity(0.5),
                    text: '-50% OFF!',
                    gifPath: paths[currentGifIndex],
                    width: 350,
                  ))),
            ]),
        ),
      );
  }
}
