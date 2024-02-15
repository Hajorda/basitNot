// ignore_for_file: unused_import

import 'dart:async';

import 'package:basitnot/auth/authPage.dart';
import 'package:basitnot/auth/loginPage.dart';
import 'package:basitnot/models/note.dart';
import 'package:basitnot/models/noteDatabase.dart';
import 'package:basitnot/pages/editPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'pages/notesPage.dart';
import 'package:provider/provider.dart';

import 'theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

ValueNotifier<bool> isDeviceConnected = ValueNotifier(false);

//Method to check if the device is connected to the internet and returns boolean value
Future<bool> checkInternetConnection() async {
  return await InternetConnectionChecker().hasConnection;
}

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
     late StreamSubscription<ConnectivityResult> subscription;
     @override
  void initState() {

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected.value = await InternetConnectionChecker().hasConnection;
    });
  }

   @override
  void dispose() {
    subscription.cancel();
  }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home:  //const notesPage(),
      const notesPage(),
      //EditPage(Note(title: "Merhaba", creationDate: DateTime.now(), lastEditDate: DateTime.now())),
      debugShowCheckedModeBanner: false,
    );
  }
}
