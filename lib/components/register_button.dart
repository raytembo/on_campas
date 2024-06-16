import 'package:flutter/material.dart';
import 'package:on_campus/themes/global_color.dart';

class RegisterButton extends StatelessWidget {
  void Function()? onTap;
  String buttonName;
  RegisterButton({required this.onTap,required this.buttonName,super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: mainColor,
          height: 50,
          width: 300,
          child: Center(child:Text(
            buttonName,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            ) ,)),
        ),
      ),
    );
  }
}
