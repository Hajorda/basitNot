// ignore_for_file: unused_import

import 'package:basitnot/auth/authPage.dart';
import 'package:basitnot/auth/loginPage.dart';
import 'package:basitnot/models/note.dart';
import 'package:basitnot/models/noteDatabase.dart';
import 'package:basitnot/pages/editPage.dart';
import 'package:flutter/material.dart';
import 'pages/notesPage.dart';
import 'package:provider/provider.dart';

import 'theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
   await NoteDatabase.init();
   await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(

   MultiProvider(providers: [
     ChangeNotifierProvider(create: (context) => NoteDatabase()),
     ChangeNotifierProvider(create: (context) => ThemeProvider()),
   ],
   child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home:  //const notesPage(),
      const AuthPage(),
      //EditPage(Note(title: "Merhaba", creationDate: DateTime.now(), lastEditDate: DateTime.now())),
      debugShowCheckedModeBanner: false,
    );
  }
}
