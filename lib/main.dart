import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/LoginSignup/Login.dart';
import 'package:footballapp/dashboard/Dashboard.dart';
import 'package:footballapp/router.dart';

import 'LoginSignup/Getstarted/started.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiniela Futbolera',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      onGenerateRoute: generateRoute,
      debugShowCheckedModeBanner: false,
      home:Login(),
      //Getting_Started(),
    );
  }
}


