// ignore_for_file: unused_element, unnecessary_null_comparison

import 'package:flutter/widgets.dart';
import 'package:myapp/database/notesdatabase.dart';
import 'package:myapp/model/notemdl.dart';
class AddnotProvider extends ChangeNotifier {
  List<Notemdl> _notes = [];
  List<Notemdl> get notes => _notes;

  Future<void> loadNotes() async {
    _notes = await NotesDatabase.instance.fetchNotes();
    notifyListeners();
  }

  Future<void> deleteNote(int index) async {
    final noteId = _notes[index].id;
    if (noteId != null) {
      await NotesDatabase.instance.deleteNote(noteId);
      _notes.removeAt(index);
      notifyListeners();
    }
  }
}
