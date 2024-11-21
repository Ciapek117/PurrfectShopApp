import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPressed});
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        height: 42,
        margin: const EdgeInsets.symmetric(horizontal: 90),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD2AF43),
            ),
            child: Text(
              label,
              style: const TextStyle(fontSize: 18, color: Color(0xFF5F0F40), fontWeight: FontWeight.bold),
            )));
  }
}
