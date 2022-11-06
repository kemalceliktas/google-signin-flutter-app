import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_first_app/provider/user_provider.dart';
import 'package:google_first_app/screens/home_screens/home.dart';
import 'package:google_first_app/services/firebase_services.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 late final userProvider = Provider.of<UserProvider>(context);
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Sign in to continue"),
                    Text(
                      "Vegi",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.green.shade900,
                              offset: Offset(3, 3),
                            )
                          ]),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SignInButton(
                      Buttons.google,
                      onPressed: ()async {
                        await FirebaseServices().signInWithGoogle();
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen(),),);
                      },
                      text: "Sign in with Google",
                    ),
                    SignInButton(
                      Buttons.apple,
                      onPressed: () {},
                      text: "Sign in with Apple",
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "By signing in you are agreeing to our",
                      style: TextStyle(color: Colors.black38),
                    ),
                    Text(
                      "Terms and Pricacy Policy",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),


    );
  }
}


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: ()async {
              await FirebaseServices().signInWithGoogle();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            child: Text("Login With Google"),
          ),
        ),
      ),
    );
  }
