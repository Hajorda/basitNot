import 'package:basitnot/models/noteDatabase.dart';
import 'package:flutter/material.dart';
import 'pages/notesPage.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const notesPage(),
    );
  }
}
