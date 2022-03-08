import 'package:flutter/material.dart';
import 'package:note_taking_app/database/sqflite_database.dart';
import 'package:note_taking_app/model/notes.dart';

class DisplayNote extends StatelessWidget {
  const DisplayNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Note note = ModalRoute.of(context)!.settings.arguments as Note;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note"),
        actions: [
          IconButton(
              onPressed: () {
                DBHelper.dbHelper.deleteNote(note.id);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (route) => false);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              note.title,
              style:
                  const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              note.body,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
