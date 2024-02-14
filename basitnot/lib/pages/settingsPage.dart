import 'package:basitnot/auth/loginPage.dart';
import 'package:basitnot/theme/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});


  // ignore: non_constant_identifier_names
  void SignUserOut(){
    FirebaseAuth.instance.signOut();
    print("SignOutFor user");
    
  }
  @override
  Widget build(BuildContext context) {
    bool isSyncWants = false;
    final currentUser = FirebaseAuth.instance.currentUser;
      String? cEmail;
     if(currentUser==null){
      cEmail = "None";
     }
     else{
      cEmail = currentUser.email;
     }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'), 
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
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
                Text(cEmail.toString(),),
                IconButton(onPressed: () {
                  SignUserOut();
                  Navigator.pop(context);
                }, icon:  const Icon(Icons.logout)),
                 IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                }, icon:  const Icon(Icons.login))
              ],
            ),),
            
          const SizedBox(height: 20,),
          
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

          const SizedBox(height: 20,),

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
              const Text('SYNC Mode'),
              CupertinoSwitch(
                value: isSyncWants, 
            
                //Listen false____???? TODO:
                onChanged: (value) => {
                  print("Sync Mode Changed"),
                  if(currentUser==null){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('You must be logged in to use this feature!'),))
                  }
                  else{
                    //TODO: PROVIDER
                    print(isSyncWants),
                    isSyncWants = !isSyncWants,
                  }
                }
                ,)
            ],),
          ),
        ],
      )
    );
  }
}

           
