import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   const LoginPage({super.key});



  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
      var textColor =  Theme.of(context).colorScheme.inversePrimary;

    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondary
                  ),
                  child: Icon(Icons.person, size: 50, color: Theme.of(context).colorScheme.primary,),
                ),
              ],
            ),

          const SizedBox(height: 20,),

          Column(
            children: [
              Text("Sign in your account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)  ),
             const SizedBox(height: 9,),
              Text("Welcome Back!" , style: TextStyle(fontSize: 20, color:textColor.withOpacity(0.7))  ),
            
             const SizedBox(height: 30,),
            
              // TEXT FIELDS
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor.withOpacity(0.7))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor)
                        )
                      ),
                      controller: emailController,
                    ),
                                 const  SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor.withOpacity(0.7))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor)
                        )
                      ),
                      controller: passwordController,
                    ),
                     SizedBox(height: 10,),
            
              Container(
                alignment: Alignment.centerRight,
                child: Text("Forgot password?", style: TextStyle(fontSize: 14, color: textColor.withOpacity(0.7))  ),
              ),
                  ],
                ),
              ),
             
              //TODO:Button

              Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  onPressed: (){
                    //TODO: Sign in
                    //signIn(emailController.text, passwordController.text, context);
                  },
                  child: Text("Sign in", style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.inversePrimary)  ),
                ),
              ),

                const SizedBox(height: 10,),

                Row(children: [
                  Expanded(child: Divider(color: textColor.withOpacity(0.7),)),
                  Text("OR", style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.7))  ),
                  Expanded(child: Divider(color: textColor.withOpacity(0.7),)),
                ],),

                const SizedBox(height: 10,),

               //TODO:Continue with Google
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.secondary
                      ),
                      child: Icon(Icons.facebook, size: 30, color: Theme.of(context).colorScheme.primary,),
                    ),
                    const SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.secondary
                      ),
                      child: Icon(Icons.g_translate, size: 30, color: Theme.of(context).colorScheme.primary,),
                    ),
                  ],
                ),
             
            
             const SizedBox(height: 20,),
            
              Container(),
             Row(mainAxisAlignment: MainAxisAlignment.center,children: [
               Text("Not have a account? ", style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.7))  ),
                Text("Register now.", style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.7), fontWeight: FontWeight.bold)  ),
             ],
             ),
              SizedBox(height: 30,),
                
            ],
          ),
        ],
      ),
    ),
    );
  }
}