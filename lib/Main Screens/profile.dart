import 'package:flutter/material.dart';
import 'package:on_campus/Auth/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () async{
              await Supabase.instance.client.auth.signOut();
              const snackBar =  SnackBar(
                content: Text('Logged Out'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Login()));
            },
          ),
        ],
      ),
    );
  }
}
