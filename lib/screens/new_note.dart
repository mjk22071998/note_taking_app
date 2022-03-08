import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_taking_app/database/sqflite_database.dart';
import 'package:note_taking_app/model/notes.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  saveNote(BuildContext context, Note note) {
    DBHelper.dbHelper.addNote(note);
    Fluttertoast.showToast(
        msg: "Note Added",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                labelText: "Note Title",
              ),
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
                child: TextField(
              controller: bodyController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                labelText: "Note body",
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            Note note = Note(
                id: -1,
                title: titleController.value.text,
                body: bodyController.value.text,
                creationDate: DateTime.now());
            saveNote(context, note);
            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
          });
        },
        label: const Text("Save note"),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
