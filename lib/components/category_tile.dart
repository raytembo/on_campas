import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  void Function()? onTap;
  String categoryName;
   CategoryTile({
    required this.onTap,
    required this.categoryName,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 100,
            height: 50,
            color: const Color.fromRGBO(87, 98, 213, 100),
            child: Center(
                child: Text(
                  categoryName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                )),
          ),
        ),
      ),
    );
  }
}
