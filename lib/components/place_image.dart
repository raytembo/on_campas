import 'package:flutter/material.dart';


class PlaceImage extends StatelessWidget {
  const PlaceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 150,
      height: 150,
      color: Colors.grey,
      child:const Center(child:Text("No Image")),
    );
  }
}
