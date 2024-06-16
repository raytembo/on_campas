import 'package:flutter/material.dart';

import '../components/category_tile.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List names = [
    "Chess",
    "SCOM",
    "Regular",
    "Memes",
    "Mental Health",
    "Sports"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Categories",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: names.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categoryName: names[index],
                    onTap: () {

                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
