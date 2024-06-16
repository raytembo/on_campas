import 'package:flutter/material.dart';
import 'package:on_campus/themes/global_color.dart';

class NewsTile extends StatelessWidget {
  final postimageurl;
  final postheadline;
  final readmore;
  const NewsTile({
     required this.postheadline,
     required this.postimageurl,
     required this.readmore,
     super.key});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.grey,
        height: 100,
        width: 300,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(postimageurl),
            Center(
              child: Text(
                postheadline,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:200.0),
              child: Text(
                readmore,
              ),
            ),

          ],
        ),
      
      ),
    );
  }
}
