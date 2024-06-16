import 'package:flutter/material.dart';
import 'package:on_campus/Auth/login.dart';
import 'package:on_campus/Main%20Screens/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class Authstate extends StatefulWidget {
  const Authstate({super.key});

  @override
  State<Authstate> createState() => _AuthstateState();
}

class _AuthstateState extends State<Authstate> {
   final stream = Supabase.instance.client.auth.onAuthStateChange.map((user) => user != null);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        final event = snapshot.data!;

        if (event == AuthChangeEvent.signedIn) {
          // Navigate to Home Page
          return Homepage();
        } else {
          // Navigate to Login Page
          return Login();
        }
      },
    );
  }
}
