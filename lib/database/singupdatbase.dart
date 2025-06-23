// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class Singupdatbase {
//   static final Singupdatbase instance = Singupdatbase._init();
//   static Database? _database;
//   Singupdatbase._init();
//   Future<Database> get database async{
//   if (_database != null) return _database!;
//   _database = await _initDB('users.db');
//   return _database!;
//   }
//   Future<Database> _createDB(String filePath) async{
//     final dbPath = await getDatabasesPath();
//     final path =join(dbPath, filePath);
// // Suggested code may be subject to a license. Learn more: ~LicenseLog:2508683387.
// // Suggested code may be subject to a license. Learn more: ~LicenseLog:2805428833.
//     return await openDatabase(path, version:1,onCreate: _createDB);
//   }
//   Future<int> insertUser(String email, String password) async {
//     final db = await instance.database;
//     return await db.insert('users', {'email': email, 'password': password});
//   }

//   Future<bool> authenticate(String email, String password) async {
//     final db = await instance.database;
//     final result = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );
//     return result.isNotEmpty;
//   }

// }
