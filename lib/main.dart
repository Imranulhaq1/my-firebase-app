import 'package:flutter/material.dart';
import 'package:myapp/provider/addnot_provider.dart';
import 'package:myapp/provider/login_provider.dart';
import 'package:myapp/provider/postcreate_provider.dart';
import 'package:myapp/provider/singup_provider.dart';
//import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart'; 
import 'package:myapp/UiPages/login_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SingupProvider()),
        ChangeNotifierProvider(create: (_) => AddnotProvider()),
        ChangeNotifierProvider(create: (_) => PostcreateProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
       
        home: const LoginPage(),
    
    );
  }
}
