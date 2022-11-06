import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_first_app/provider/product_provider.dart';
import 'package:google_first_app/provider/review_cart_provider.dart';
import 'package:google_first_app/provider/user_provider.dart';
import 'package:google_first_app/screens/home_screens/home.dart';


import 'package:google_first_app/screens/login.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ProductProvider>(
      create:(context)=>ProductProvider(),),
      ChangeNotifierProvider<UserProvider>(
      create:(context)=>UserProvider(),),
      ChangeNotifierProvider<ReviewCartProvider>(
      create:(context)=>ReviewCartProvider(),),

    ],
    child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  
  }
}

