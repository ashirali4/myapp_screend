import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballapp/Components/loader.dart';
import 'package:footballapp/Icons/my_flutter_app_icons.dart';
class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final formkey=new GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool radio=false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  bool _success;
  String _userEmail;
  String _password;
  String _fullname;

  @override
  initState(){
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child:  Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Container(
                          child:
                          Column(
                            children: [
                              Icon(MyFlutterApp.football_ball_variant,color: Colors.white,size: 40,),
                              SizedBox(height: 10,),
                              Text("Football Bidder",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'OpenSans',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35,right: 35),
                          child: Form(
                            key: formkey,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Sign up using email",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                    color: Colors.white,
                                  ),),
                                SizedBox(height: 40,),
                                TextFormField(
                                  controller: _fullnameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Full Name';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.name,
                                  decoration: new InputDecoration(


                                      contentPadding: EdgeInsets.all(0.0),
                                      labelText: "Enter your name",
                                      labelStyle: TextStyle(
                                        fontFamily: "OpenSansBold",
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        //  when the TextFormField in unfocused
                                      ) ,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green),
                                        //  when the TextFormField in focused
                                      ) ,
                                      border: UnderlineInputBorder(
                                      )
                                  ),

                                ),
                                SizedBox(height: 20,),
                                TextFormField(
                                  controller: _emailController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Email';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: new InputDecoration(


                                      contentPadding: EdgeInsets.all(0.0),
                                      labelText: "Enter e-mail",
                                      labelStyle: TextStyle(
                                        fontFamily: "OpenSansBold",
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        //  when the TextFormField in unfocused
                                      ) ,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green),
                                        //  when the TextFormField in focused
                                      ) ,
                                      border: UnderlineInputBorder(
                                      )
                                  ),

                                ),
                                SizedBox(height: 20,),
                                TextFormField(
                                  controller: _passwordController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Password';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: new InputDecoration(


                                      contentPadding: EdgeInsets.all(0.0),
                                      labelText: "Enter password",
                                      labelStyle: TextStyle(
                                        fontFamily: "OpenSansBold",
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        //  when the TextFormField in unfocused
                                      ) ,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green),
                                        //  when the TextFormField in focused
                                      ) ,
                                      border: UnderlineInputBorder(
                                      )
                                  ),
                                ),
                                SizedBox(height: 10,),

                                SizedBox(height: 10,),
                                Text("By Signing Up you agree to our Terms and Conditions.",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'OpenSans',
                                    color: Colors.white.withOpacity(.8),
                                  ),),
                                SizedBox(height: 50,),
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.green)),
                                    onPressed: () async {
                                      if (formkey.currentState.validate()) {
                                        onLoading(context);

                                      try {
                                        final  user = (await
                                        _auth.createUserWithEmailAndPassword(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        )
                                        ).user;
                                        _responsehandle(user,message("Sign Up Completed", Icons.check_circle_outline, Colors.green));

                                      } catch (error) {
                                        print(error.code);
                                        switch (error.code) {
                                          case 'email-already-in-use':
                                            _responsehandle(null,message("Duplicate Email", Icons.cancel, Colors.red));
                                            break;
                                          case 'network-request-failed':
                                            _responsehandle(null,message("No Network Connection", Icons.network_check, Colors.orange));
                                            break;
                                          case 'invalid-email':
                                            _responsehandle(null,message("Invalid Email", Icons.alternate_email, Colors.red));
                                            break;

                                        }
                                      }
                                      }
                                    },
                                    color: Colors.green,
                                    textColor: Colors.white,
                                    child: Text("Click to Sign Up",
                                        style: TextStyle(fontSize: 14)),
                                  ),
                                ),
                                SizedBox(height: 30,),

                              ],

                            ),
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: new BoxDecoration(
                color: Colors.black,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: new AssetImage("assets/football.jpg"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _responsehandle(var user,Widget response){

    Navigator.pop(context);
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: (){
            Navigator.pop(context);
            Navigator.pop(context);
            return null;
          },
          child: GestureDetector(
            onTap:(){
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Dialog(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: response,
              ),
            ),
          ),
        );
      },
    );
  }
  Widget message(String message,IconData icon,Color color){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Icon(icon,color: color,size: 50,),
        SizedBox(height: 20,),
        new Text(message,style: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),),
      ],
    );
  }
}
