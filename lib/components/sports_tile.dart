import 'package:flutter/material.dart';

class SportsTile extends StatelessWidget {
  const SportsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 80,
        width: 380,
        color: Colors.grey,
        child: const Column(children: [
          SizedBox(height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Padding(
                 padding: EdgeInsets.only(left:50.0),
                 child: Text("Left Team"),
               ),
               Text("Vs"),
               Padding(
                 padding: EdgeInsets.only(right:50.0),
                 child: Text("Right Team"),
               )
             ],
           ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(right:20.0),
                child: Text("0"),
              ),
              Padding(
                padding: EdgeInsets.only(left:20.0),
                child: Text("0"),
              )
            ],
          ),
        ],),
      ),
    );
  }
}
