import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/gif_tile.dart';

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

  void onSwipe(DragUpdateDetails details){
    if(details.primaryDelta! > 0){
      setState(() {
        currentGifIndex = (currentGifIndex - 1 + paths.length) % paths.length;
      });
    } else if(details.primaryDelta! < 0){
      setState(() {
        currentGifIndex = (currentGifIndex + 1) % paths.length;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F0F40),
      body: SingleChildScrollView(
        child: Column(
          children:[
            const SizedBox(height: 25),

            //tile z gifami
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: SizedBox(
                height: 450,
                child: paths.isNotEmpty
                    ? GestureDetector(onHorizontalDragUpdate: onSwipe,
                      child: AnimatedSwitcher(duration: const Duration(seconds: 1),transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);},
                        child: GifTile(
                            key: ValueKey<int>(currentGifIndex), //ustawia, ze kazdy tile jest "wyjatkowy" na zasadzie currentGifIndex
                            gifPath: paths[currentGifIndex],
                            width: 350)))

                // Ładowanie w trakcie pobierania gifów
                    : const Center(child: CircularProgressIndicator()))),
            ])));
  }
}
