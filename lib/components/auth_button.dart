import 'package:flutter/material.dart';

class MyTextFile extends StatelessWidget {
  final TextEditingController userInput;
  bool obscure;
  String hint;
  MyTextFile({
    super.key,
    required this.obscure,
    required this.hint,
    required this.userInput,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: userInput,
        obscureText: obscure,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: hint),
      ),
    );
  }
}