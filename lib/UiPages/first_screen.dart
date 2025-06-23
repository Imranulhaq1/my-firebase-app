import 'package:flutter/material.dart';
import 'package:myapp/Custem_weight/media_app.dart';
import 'package:myapp/Custem_weight/textfiled.dart';
import 'package:myapp/UiPages/login_page.dart';
import 'package:myapp/provider/singup_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SingupProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFC9700),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
        //child: SingleChildScrollView(
          child: ListView(
          //Column(
            children: [
              //SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: Text(
                  "Welcom Blogging",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(
                errorText: provider.nameError,
                controller: provider.nameController,
                prefixIcon: Icon(Icons.person),
                hintText: 'Full Name',
              ),
              SizedBox(height: 10),
              CustomTextField(
                errorText: provider.emailError,
                controller: provider.emailController,
                prefixIcon: Icon(Icons.email),
                hintText: 'Valid Email',
              ),
              SizedBox(height: 10),
              CustomTextField(
                errorText: provider.passError,
                controller: provider.passController,
                prefixIcon: Icon(Icons.lock),
                hintText: 'Password',
              ),
              SizedBox(height: 10),
              CustomTextField(
                errorText: provider.confrimc,
                controller: provider.conpassController,
                prefixIcon: Icon(Icons.lock),
                hintText: 'Confrim Password',
              ),
              SizedBox(height: 10),
              Consumer<SingupProvider>(
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
                              provider.signUpUser(context);
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
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),  
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage(),
                        ),
                        );
                       //provider.clearFields(); 
                    },
                    child: Text("Log In", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 8),
              MediaApp(),
            ],
          ),
        ),
      //),
    );
  }
}
