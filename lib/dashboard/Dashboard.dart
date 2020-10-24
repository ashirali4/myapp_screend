import 'package:flutter/material.dart';
import 'package:footballapp/Icons/my_flutter_app_icons.dart';
import 'package:footballapp/Pages/Home.dart';
import 'package:footballapp/Pages/MyResult.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  int currentindex=0;
  List<Widget> mypages=[
    Home_Page(),
    MyResult()
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B2439),
      appBar: AppBar(
        backgroundColor: Color(0xFf1BE37E),
        title: Text("Fooball Bidder"),
      ),
      drawer: Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xff2f3849)),
         child: Drawer(

          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Expanded(
                  child: ListView(children: [
                    Container(
                      color:  Color(0xFF212733),
                      child: ExpansionTile(
                        backgroundColor: Color(0xFF212733),
                        title: Row(
                          children: [

                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                  AssetImage("assets/boy.png"),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              width: 60.0,
                              height: 60.0,
                              decoration: new BoxDecoration(
                                color: Colors.transparent,

                                borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                                border: new Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "Ashir Ali",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.7),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "ashir@gmail.com",
                                  style: TextStyle(color: Colors.white.withOpacity(.7),
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        children: <Widget>[

                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [Icon(Icons.supervised_user_circle,color: Colors.white.withOpacity(.7),),
                                  SizedBox(width: 10,),
                                  Text("My Profile",style: TextStyle(
                                      fontFamily: "robo",
                                      color: Colors.white.withOpacity(.7),
                                      fontSize: 18

                                  ),),
                                ],
                              ),
                            ),
                          ),

                          ListTile(
                            title:Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [Icon(Icons.exit_to_app,color: Colors.white.withOpacity(.7),),
                                  SizedBox(width: 10,),
                                  Text("Sign Off",style: TextStyle(
                                      fontFamily: "robo",
                                      color:Colors.white.withOpacity(.7),
                                      fontSize: 18

                                  ),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ListTile(

                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                        children: [Icon(MyFlutterApp.home),
                          SizedBox(width: 15,),
                          Text("Home",style: TextStyle(
                          fontFamily: "pb",
                          fontSize: 18

                    ),),
                    ],
                  ),
                      ),

                      onTap: () {
                        setState(() {
                          currentindex=0;
                        });
                       Navigator.pop(context);
                      },
                    ),

                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(MyFlutterApp.soccer_ball),
                            SizedBox(width: 15,),
                            Text("My Pool",style: TextStyle(
                                fontFamily: "pb",
                                fontSize: 18

                            ),),
                          ],
                        ),
                      ),

                      onTap: () {
                        setState(() {
                          currentindex=1;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
//                    ListTile(
//                      title: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Row(
//                          children: [Icon(MyFlutterApp.calendar),
//                            SizedBox(width: 15,),
//                            Text("Tournaments",style: TextStyle(
//                                fontFamily: "pb",
//                                fontSize: 18
//
//                            ),),
//                          ],
//                        ),
//                      ),
//
//                      onTap: () {
//                        Navigator.of(context).pop();
//                      },
//                    ),
//                    ListTile(
//                      title: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Row(
//                          children: [Icon(MyFlutterApp.medical_result),
//                            SizedBox(width: 15,),
//                            Text("My Result",style: TextStyle(
//                                fontFamily: "pb",
//                                fontSize: 18
//
//                            ),),
//                          ],
//                        ),
//                      ),
//
//                      onTap: () {
//                        Navigator.of(context).pop();
//                      },
//                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(MyFlutterApp.trophy__1_),
                            SizedBox(width: 15,),
                            Text("Top 10",style: TextStyle(
                                fontFamily: "pb",
                                fontSize: 18

                            ),),
                          ],
                        ),
                      ),

                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
//                    ListTile(
//                      title: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Row(
//                          children: [Icon(MyFlutterApp.gift),
//                            SizedBox(width: 15,),
//                            Text("Awards",style: TextStyle(
//                                fontFamily: "pb",
//                                fontSize: 18
//
//                            ),),
//                          ],
//                        ),
//                      ),
//
//                      onTap: () {
//                        Navigator.of(context).pop();
//                      },
//                    ),



                  ]),
                )
              ],
            ),
          ),
        ),
      ),
      body:mypages[currentindex],

    );
  }
}
