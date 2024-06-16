import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final TextEditingController userEntry;
  const UserInput({
    required this.userEntry,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      controller: userEntry,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)),
          hintText: "What's on your mind ?"),
    );
  }
}
