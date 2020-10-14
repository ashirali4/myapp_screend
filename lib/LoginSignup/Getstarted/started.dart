import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballapp/Icons/my_flutter_app_icons.dart';
class Getting_Started extends StatefulWidget {
  @override
  _Getting_StartedState createState() => _Getting_StartedState();
}

class _Getting_StartedState extends State<Getting_Started> {

  @override
  initState(){
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
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
                Padding(
                  padding: const EdgeInsets.only(left: 35,right: 35),
                  child: Container(
                    child: Column(
                      children: [
                        Text("Bid Football Matches and Win Cash",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                          ),),
                        SizedBox(height: 10,),
                        Text("With our app you can win prize with foodball anytime and everywhere",
                          style: TextStyle(
                            fontSize: 13,

                            fontFamily: 'OpenSans',
                            color: Colors.white.withOpacity(.8),
                          ),),
                        SizedBox(height: 30,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.green)),
                            onPressed: () {
                              Navigator.pushNamed(context, "signup");
                            },
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Text("Create an Account",
                                style: TextStyle(fontSize: 14)),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.white)),
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            color: Colors.transparent,
                            textColor: Colors.white,
                            child: Text("Login with e-mail",
                                style: TextStyle(fontSize: 14)),
                          ),
                        ),
                        SizedBox(height: 30,),

                      ],

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
    );
  }
}
