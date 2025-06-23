import 'package:flutter/material.dart';
import 'package:myapp/UiPages/post_screen.dart';
import 'package:myapp/provider/addnot_provider.dart';
import 'package:provider/provider.dart';

class AddBlocScreen extends StatefulWidget {
  const AddBlocScreen({super.key});
  @override
  State<AddBlocScreen> createState() => _AddBlocScreenState();
}

class _AddBlocScreenState extends State<AddBlocScreen> {
  @override
  void initState() {
    super.initState();
    // Load notes when the screen first initializes
    Future.microtask(() {
      Provider.of<AddnotProvider>(context, listen: false).loadNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddnotProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFFC9700),
            title: const Text("Your Bloc"),
          ),
          body:
              provider.notes.isEmpty
                  ? const Center(
                    child: Text('No posts yet. Tap + to create one.'),
                  )
                  : ListView.builder(
                    itemCount: provider.notes.length,
                    itemBuilder: (context, index) {
                      final note = provider.notes[index];
                      final avatarLetter =
                          note.title?.isNotEmpty == true
                              ? note.title![0].toUpperCase()
                              : '?';

                      return Card(
                        elevation: 2,
                        color: Colors.cyanAccent,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.orangeAccent,
                            child: Text(
                              avatarLetter,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(note.title ?? ''),
                          subtitle: Text(note.description ?? ''),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // You can implement note editing here
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  provider.deleteNote(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PostScreen()),
              );
              if (result == true) {
                await Provider.of<AddnotProvider>(
                  context,
                  listen: false,
                ).loadNotes();
              }
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:myapp/UiPages/post_screen.dart';
// import 'package:myapp/provider/addnot_provider.dart';
// import 'package:provider/provider.dart';

// class AddBlocScreen extends StatelessWidget {
//   const AddBlocScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AddnotProvider>(context);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (provider.notes.isEmpty) {
//         provider.loadNotes();
//       }
//     });
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFFC9700),
//         title: const Text("Your Bloc"),
      
//       ),
//       body:
//           provider.notes.isEmpty
//               ? const Center(child: Text('No posts yet. Tap + to create one.'))
//               : ListView.builder(
//                 itemCount: provider.notes.length,
//                 itemBuilder: (context, index) {
//                   final note = provider.notes[index];
//                   final avatarLetter =
//                       note.title!.isNotEmpty
//                           ? note.title![0].toUpperCase()
//                           : '?';
//                   return Card(
//                     elevation: 2,
//                     color: Colors.cyanAccent,
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 6,
//                     ),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: Colors.orangeAccent,
//                         child: Text(
//                           avatarLetter,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       title: Text(note.title ?? ''),
//                       subtitle: Text(note.description ?? ''),
//                       trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                                   onPressed: () {
                              
//                                     //showForm(userData["key"]);
//                                   },
//                                   icon: const Icon(Icons.edit),
//                                 ),

//                           IconButton(
//                             onPressed: () {
//                               provider.deleteNote(index);
//                             },
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => const PostScreen()),
//           );
//           if (result == true) {
//             provider.loadNotes();
//           }
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
