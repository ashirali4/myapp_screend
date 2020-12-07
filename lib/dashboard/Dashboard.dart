import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/Icons/my_flutter_app_icons.dart';
import 'package:footballapp/Pages/Home.dart';
import 'package:footballapp/Pages/MyPool.dart';
import 'package:footballapp/Pages/MyResult.dart';
import 'package:footballapp/Pages/Spendings.dart';
import 'package:footballapp/Pages/Top20.dart';
import 'package:footballapp/model/Userdetailsmodel.dart';

import '../APIcalls.dart';
class Dashboard extends StatefulWidget {
  String link;
  @override
  _DashboardState createState() => _DashboardState();
   Dashboard(this.link);

}

class _DashboardState extends State<Dashboard> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.reference();
  User user;
  List<Widget> mypages;
  String link;
  @override
  void initState()  {
    // TODO: implement initState
     user= auth.currentUser;
   //  link=widget.link;
     mypages=[
       Home_Page(widget.link),
       MyPool(widget.link),
       MyResult(),
       Topusers(),
       Spendings()
     ];
     super.initState();
  }

  Future<Userdetailmodel> loadnmae() async {
    Userdetailmodel temp;
    await databaseReference.child("Users").child(user.uid).once().then((DataSnapshot snapshot) {
      temp=Userdetailmodel.fromSnapshot(snapshot);
      print("sddddddddddddddd" + temp.email);
      firebasehanlder.setbalance(temp.balance);
    });
    return temp;
  }

  @override
  int currentindex=0;

  Widget build(BuildContext context) {

   print("kkk");
    return Scaffold(
      backgroundColor: Color(0xff1B2439),
      appBar: AppBar(
        backgroundColor: Color(0xFf1BE37E),
        title: Text("Quiniela Futbolera"),
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
                        title: Padding(
                          padding: const EdgeInsets.only(top: 7,bottom: 7),
                          child: Row(
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
                                  new FutureBuilder<Userdetailmodel>(
                                    future: loadnmae(), // a Future<String> or null
                                    builder: (BuildContext context, AsyncSnapshot<Userdetailmodel> snapshot) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none: return new Text('Press button to start');
                                        case ConnectionState.waiting: return new Text('Awaiting result...');
                                        default:
                                          if (snapshot.hasError)
                                            return new Text('Error: ${snapshot.error}');
                                          else{
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data.name,
                                                  style: TextStyle(
                                                      color: Colors.white.withOpacity(.7),
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  "Balance: "+ firebasehanlder.balance.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white.withOpacity(.7),
                                                      fontSize: 15.0,
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                )

                                              ],
                                            );
                                          }

                                      }
                                    },
                                  ),

                                  Text(
                                    user.email,
                                    style: TextStyle(color: Colors.white.withOpacity(.7),
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        children: <Widget>[

                          // ListTile(
                          //   title: Padding(
                          //     padding: const EdgeInsets.only(left: 10),
                          //     child: Row(
                          //       children: [Icon(Icons.supervised_user_circle,color: Colors.white.withOpacity(.7),),
                          //         SizedBox(width: 10,),
                          //         Text("My Profile",style: TextStyle(
                          //             fontFamily: "robo",
                          //             color: Colors.white.withOpacity(.7),
                          //             fontSize: 18
                          //
                          //         ),),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
                            },
                            child: ListTile(
                              title:Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [Icon(Icons.monetization_on_outlined,color: Colors.white.withOpacity(.7),),
                                    SizedBox(width: 10,),
                                    Text("Deposit",style: TextStyle(
                                        fontFamily: "robo",
                                        color:Colors.white.withOpacity(.7),
                                        fontSize: 18

                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
                            },
                            child: ListTile(
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
                   ListTile(
                     title: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [Icon(MyFlutterApp.calendar),
                           SizedBox(width: 15,),
                           Text("My Results",style: TextStyle(
                               fontFamily: "pb",
                               fontSize: 18

                           ),),
                         ],
                       ),
                     ),

                     onTap: () {
                       setState(() {
                         currentindex=2;
                       });
                       Navigator.of(context).pop();
                     },
                   ),
                   ListTile(
                     title: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [Icon(MyFlutterApp.trophy__1_),
                           SizedBox(width: 15,),
                           Text("Top 20",style: TextStyle(
                               fontFamily: "pb",
                               fontSize: 18

                           ),),
                         ],
                       ),
                     ),

                     onTap: () {
                       setState(() {
                         currentindex=3;
                       });
                       Navigator.of(context).pop();
                     },
                   ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Icon(Icons.history_outlined,color: Colors.white.withOpacity(.7),),
                            SizedBox(width: 15,),
                            Text("Spendings",style: TextStyle(
                                fontFamily: "pb",
                                fontSize: 18

                            ),),
                          ],
                        ),
                      ),

                      onTap: () {
                        setState(() {
                          currentindex=4;
                        });
                        Navigator.of(context).pop();
                      },
                    ),


//                     ListTile(
//                       title: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [Icon(MyFlutterApp.trophy__1_),
//                             SizedBox(width: 15,),
//                             Text("Top 10",style: TextStyle(
//                                 fontFamily: "pb",
//                                 fontSize: 18
//
//                             ),),
//                           ],
//                         ),
//                       ),
//
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
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
