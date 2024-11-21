import 'package:flutter/material.dart';
import 'dart:ui';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.label, required this.onPressed});
  final String label;
  final void Function()? onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        height: 42,
        margin: EdgeInsets.symmetric(horizontal: 90),
        child: ElevatedButton(
            onPressed: widget.onPressed,
            onHover: (val) => {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFD2AF43),

            ),
            child: Text(
              widget.label,
              style: const TextStyle(fontSize: 18, color: Color(0xFF5F0F40), fontWeight: FontWeight.bold),
            )));
  }
}
