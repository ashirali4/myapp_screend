import 'package:flutter/material.dart';
import 'package:footballapp/dashboard/Dashboard.dart';
import 'LoginSignup/SignUp.dart';
import 'LoginSignup/Login.dart';

Route<dynamic> generateRoute(RouteSettings settings) {


  switch (settings.name) {


    case 'login':
      return MaterialPageRoute(builder: (context) => Login());
    case 'signup':
      return MaterialPageRoute(builder: (context) => SignUp());
    case 'dashboard':
      return MaterialPageRoute(builder: (context) => Dashboard());

  }
}