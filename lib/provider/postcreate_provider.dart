import 'package:flutter/material.dart';
import 'package:myapp/UiPages/add_bloc_screen.dart';
import 'package:myapp/database/notesdatabase.dart';
import 'package:myapp/model/notemdl.dart';

class PostcreateProvider extends ChangeNotifier {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;
  void publishNote(BuildContext context) async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    if (title.isNotEmpty && description.isNotEmpty) {
      final newNote = Notemdl(title: title, description: description);
      await NotesDatabase.instance.insertNote(newNote);
      _titleController.clear();
      _descriptionController.clear();
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => AddBlocScreen()));
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Please enter title and description',
            style: TextStyle(color: Colors.white),
          )));
      notifyListeners();
    }
  }
}
