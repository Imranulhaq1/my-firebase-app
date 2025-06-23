import 'package:flutter/material.dart';
import 'package:myapp/Custem_weight/media_app.dart';
import 'package:myapp/Custem_weight/textfiled.dart';
import 'package:myapp/UiPages/first_screen.dart';
import 'package:myapp/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginProvider>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 173, 68),
      appBar: AppBar(
        backgroundColor: Color(0xFFFC9700),
        title: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: ListView(
                children: [
                  //SizedBox(height: 25, width: 25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    controller: provider.emailController,
                   prefixIcon: Icon(Icons.email),
                    hintText: 'Enter Email',
                    errorText: provider.emailError,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'Enter Password',
                    controller: provider.passController,
                    prefixIcon: Icon(Icons.lock),
                    errorText: provider.passError,
                  ),
                  SizedBox(height: 25),
                  Consumer<LoginProvider>(
                    builder: (context, provider, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(410, 48),
                        ),
                        onPressed:
                            provider.isLoading
                                ? null
                                : () {
                                  provider.loginUser(context);
                                },
                        child:
                            provider.isLoading
                                ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                    strokeWidth: 2,
                                  ),
                                )
                                : Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "i have no account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 0),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 50),
                  MediaApp(),
                ],
              ),
      ),
          
    );
  }
}
