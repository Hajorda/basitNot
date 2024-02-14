import 'package:basitnot/theme/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});


  void SignUserOut(){
    FirebaseAuth.instance.signOut();
    print("SignOutFor user");
    
  }
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'), 
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(currentUser.email!),
                IconButton(onPressed: () {
                  SignUserOut();
                  Navigator.pop(context);
                }, icon:  Icon(Icons.logout))
              ],
            ),),
          
          //Dark Mode Switch
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Text('Dark Mode'),
              CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, 
            
                //Listen false____???? TODO:
                onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme()
                ,)
            ],),
          ),
        ],
      )
    );
  }
}