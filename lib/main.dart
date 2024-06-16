import 'package:flutter/material.dart';
import 'package:on_campus/Auth/authstate.dart';
import 'package:on_campus/themes/global_color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future <void> main() async {
  await Supabase.initialize(
    url: 'https://ssflfwzatogeyhmkkggy.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNzZmxmd3phdG9nZXlobWtrZ2d5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg0NDUxNDYsImV4cCI6MjAzNDAyMTE0Nn0.nZVPD6vFJnTDhVCHC_2fXePAQ3asbyqc0P57qszDIcg',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Countries',
      debugShowCheckedModeBanner: false,
      home: const Authstate(),
      darkTheme: darkMode,

    );
  }
}

