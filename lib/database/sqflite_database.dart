import 'package:note_taking_app/model/notes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();
  Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = initDB();
      return _database;
    } else{
      return _database;
    }
    
  }

  static const String tableName = "Notes";
  static const String col1Name = "Title";
  static const String col2Name = "Body";
  static const String col3Name = "Creation_Date";

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), "notes.db"),
        onCreate: ((db, version) async {
      await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        $col1Name TEXT,
        $col2Name TEXT,
        $col3Name DATE
      )
      ''');
    }), version: 1);
  }

  addNote(Notes note) async {
    final db = await database;
    db!.insert(tableName, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<dynamic> getAllNotes() async {
    final db = await database;
    List<Map> res = await db!.query(tableName);
    if (res.isEmpty) {
      return null;
    } else {
      return res.toList();
    }
  }
}
