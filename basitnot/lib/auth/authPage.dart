import 'package:basitnot/auth/loginPage.dart';
import 'package:basitnot/pages/notesPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(), 
     builder: (context, snapshot) {
       if (snapshot.hasData) {
         return const notesPage();
       }
       else{
        return const LoginPage();
       }
     }, ) ,);
  }
}
