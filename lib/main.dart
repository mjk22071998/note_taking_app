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
  getNotes() async {
    return await getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Note Taking App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: getNotes(),
        builder: (context, notesSnapshot) {
          switch (notesSnapshot.connectionState) {
            case ConnectionState.waiting:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ConnectionState.done:
              {
                if (notesSnapshot.data == null) {
                  return const Center(
                    child: Text(
                        "You have'nt created any notes yet, Please create one"),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(),
                  );
                }
              }
          }
        },
      ),
    );
  }
}
