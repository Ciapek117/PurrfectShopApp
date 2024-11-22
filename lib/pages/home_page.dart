import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import '../widgets/custom_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
