import 'package:flutter/material.dart';
import 'package:myapp/UiPages/add_bloc_screen.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  
  String? emailError;
  String? passError;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loginUser(BuildContext context) async {
    emailError = null;
    passError = null;
    notifyListeners();

    final email = emailController.text.trim();
    final password = passController.text.trim();

    if (email.isEmpty && password.isEmpty) {
      emailError = 'Enter a valid email';
      passError = 'Enter a valid password';
      notifyListeners();
      return;
    } else if (email.isEmpty) {
      emailError = 'Enter a valid email';
      notifyListeners();
      return;
    } else if (password.isEmpty) {
      passError = 'Enter a valid password';
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    // Simulate login delay
    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => AddBlocScreen()),
    );
  }
}
