import 'package:flutter/material.dart';
import 'package:myapp/UiPages/add_bloc_screen.dart';

class SingupProvider extends ChangeNotifier{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController conpassController = TextEditingController();
  String? nameError;
  String? emailError;
  String? passError;
  String? confrimc;
  bool _isLoading= false;
  bool get isLoading => _isLoading;
    void clearFields(){
    nameController.clear();
    emailController.clear();
    passController.clear();
    conpassController.clear();
    notifyListeners();
  }
 void signUpUser(BuildContext context) {
    nameError = null;
    emailError = null;
    passError = null;
    confrimc = null;
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passController.text.trim();
    String confirm = conpassController.text.trim(); 
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (name.isEmpty && email.isEmpty && password.isEmpty && confirm.isEmpty) {
      nameError = "Enter user name";
      emailError = "Enter email";
      passError = "Enter password";
      confrimc = "Confirm password";
    } else if (name.isEmpty) {
      nameError = "Enter user name";
    } else if (name.length < 6) {
      nameError = "Name must be at least 6 characters";
    } else if (email.isEmpty) {
      emailError = "Enter email";
    } else if (!emailRegex.hasMatch(email)) {
      emailError = "Enter a valid email";
    } else if (password.isEmpty) {
      passError = "Enter password";
    } else if (password.length < 6) {
      passError = "Password must be at least 6 characters";
    } else if (confirm.isEmpty) {
      confrimc = "Confirm password";
    } else if (password != confirm) {
      confrimc = "Passwords do not match";
    } else {
      _isLoading = true;
      notifyListeners();
      Future.delayed(Duration(seconds: 2));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddBlocScreen(),
        
        ),
      
      );
      // ignore: unused_element
  // void clearFields(){
  //   nameController.clear();
  //   emailController.clear();
  //   passController.clear();
  //   conpassController.clear();
  //   notifyListeners();
  // }
      //_isLoading= false;
    }
  notifyListeners();
}

}