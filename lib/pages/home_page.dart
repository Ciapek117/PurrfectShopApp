import 'package:flutter/material.dart';

import '../widgets/custom_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F0F40),
      body: Column(
        children:[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: SizedBox(
                height: 130,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CustomTile())),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
