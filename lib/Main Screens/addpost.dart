import 'package:flutter/material.dart';
import 'package:on_campus/components/place_image.dart';
import 'package:on_campus/components/user_input.dart';

class Addpost extends StatefulWidget {
  const Addpost({super.key});

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  TextEditingController postController = TextEditingController();

  String? dropDownValue = "Sports";
  String? headline = "Post";

  dynamic changes(choice) {
    // before with intial value Sports
    //  print(dropDownValue);
    setState(() {
      dropDownValue = choice;
    });
    //After state
    //  print(dropDownValue);
    //print(choice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            const PlaceImage(),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserInput(userEntry:postController ),
            ),
            const SizedBox(height: 30,),
            const Text("Choose your category"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu(
                enableSearch: true,
                hintText: "Category",
                onSelected: changes,
                dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                  DropdownMenuEntry(value: "Sports", label: "Sports"),
                  DropdownMenuEntry(value: "Regular", label: "Regular"),
                  DropdownMenuEntry(value: "SCOM", label: "SCOM"),
                  DropdownMenuEntry(value: "Chess", label: "Chess"),
                ],
              ),
            ),
            const Text("Choose Media (Optional)"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: (){},
                  child: const Icon(
                    Icons.photo,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
