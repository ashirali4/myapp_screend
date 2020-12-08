import 'package:flutter/material.dart';
import 'package:footballapp/Pages/deposit.dart';
import 'package:footballapp/dashboard/Dashboard.dart';
import 'LoginSignup/SignUp.dart';
import 'LoginSignup/Login.dart';
import 'Pages/weekly_match_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {

  var obj=settings.arguments;
  var link=settings.arguments;

  switch (settings.name) {


    case 'login':
      return MaterialPageRoute(builder: (context) => Login());
    case 'signup':
      return MaterialPageRoute(builder: (context) => SignUp());
    case 'dashboard':
      return MaterialPageRoute(builder: (context) => Dashboard(link));
    case 'weeklyview':
      return MaterialPageRoute(builder: (context) => Weekly_Match_View(obj));
    case 'deposit':
      return MaterialPageRoute(builder: (context) => Deposit());


  }
}