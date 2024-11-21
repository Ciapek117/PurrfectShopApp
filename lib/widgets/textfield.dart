import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.label,
      this.controller,
      this.isPassword = false});
  final String hint;
  final String label;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.orange[400]),
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.yellow[700]),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          label: Text(label, style: TextStyle(color: Colors.yellow[700]),),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.black, width: 1))),
    );
  }
}
