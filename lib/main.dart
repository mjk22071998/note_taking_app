import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Note Taking App",
      initialRoute: "/",
      routes: {"/": (context) => HomePage()},
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.deepOrange,
          onPrimary: Colors.deepOrangeAccent,
          secondary: Colors.deepPurple,
          onSecondary: Colors.deepPurpleAccent,
          error: Colors.red,
          onError: Colors.redAccent,
          background: Colors.white,
          onBackground: Colors.grey.shade100,
          surface: Colors.white,
          onSurface: Colors.grey.shade100,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Note Taking App",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
