import 'package:flutter/material.dart';
import 'package:myapp/Custem_weight/textfiled.dart';
import 'package:myapp/provider/postcreate_provider.dart';
import 'package:provider/provider.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});
  @override
  State<PostScreen> createState() => _PostScreenState();
}
class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostcreateProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFC9700),
        title: const Text("Create Post", style: TextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              CustomTextField(
                borderColor: Colors.brown,
                controller: provider.titleController,
                hintText: 'Title Or Qustion',
              ),
              SizedBox(height: 20),
              CustomTextField(
                borderColor: Colors.blueAccent,
                controller: provider.descriptionController,
                hintText: 'description',
                maxLines: 15,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFC9700),
                  fixedSize: Size(410, 48),
                ),
                onPressed: () {
                  provider.publishNote(context);
                },
                child: Text(
                  "Publish",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 8, 114, 201),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
