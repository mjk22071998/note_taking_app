import 'package:flutter/material.dart';
import 'package:note_taking_app/database/sqflite_database.dart';
import 'package:note_taking_app/model/notes.dart';

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
      routes: {"/": (context) => const HomePage()},
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
    return await DBHelper.dbHelper.getAllNotes();
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
                  return const Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "You have'nt created any notes yet, Please create one",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  List<Map<String, dynamic>> maps =
                      notesSnapshot.data as List<Map<String, dynamic>>;
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: maps.length,
                      itemBuilder: (context, index) {
                        Notes note = Notes.fromMap(maps[index]);
                        return Card(
                          child: ListTile(
                            title: Text(note.title),
                            subtitle: Text(note.body),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            default:
              {
                return const Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "You have'nt created any notes yet, Please create one",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        elevation: 5,
        child: const Icon(Icons.add),
      )
    );
  }
}
