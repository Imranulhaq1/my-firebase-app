import 'package:myapp/model/notemdl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;
  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertNote(Notemdl note) async {
  final db = await instance.database;
  return await db.insert('notes', note.toMap());
}

  Future<List<Notemdl>> fetchNotes() async {
    final db = await instance.database;
    final result = await db.query('notes');
    return result.map((map) => Notemdl.fromMap(map)).toList();
  }
  Future<int> updateNote(int id, Notemdl note) async {
    final db = await instance.database;
    return await db.update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }
  Future<int> deleteNote(int index)async{
    final db = await instance.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [index]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

