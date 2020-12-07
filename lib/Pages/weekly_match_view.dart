import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footballapp/Components/loader.dart';
import 'package:footballapp/Components/mycusotom.dart';
import 'package:footballapp/Icons/my_flutter_app_icons.dart';
import 'package:footballapp/model/load_matches_api_model.dart';
import 'package:footballapp/model/match_entry_model.dart';
import 'package:footballapp/model/sender_fromweek_one.dart';

import '../APIcalls.dart';
class Weekly_Match_View extends StatefulWidget {
  sender mylist;
  @override
  _Weekly_Match_ViewState createState() => _Weekly_Match_ViewState();
  Weekly_Match_View(this.mylist);
}

class _Weekly_Match_ViewState extends State<Weekly_Match_View> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<match_entry_model> matches=new List<match_entry_model>();
  Future<LoadMatchesApiModel> mylist;
  List<int> groupvalues=[];
  User user;
  int Selectedvalue=0;
  int leftvalue=0;
  int rightvalue=0;
  int tempvalue=123;
  match_entry_model model;
  String temp;
  int selectedRadio=0;
  Future<String> loadselection(String matchid,int index) async {

    await databaseReference.child("Users").child(user.uid).child(widget.mylist.week).child(matchid).child("winteamkey").once().then((DataSnapshot snapshot) {
      setState(() {
        temp=snapshot.value;
        print(snapshot.value);
        groupvalues[index]=int.parse(snapshot.value);
        matches[index].swinteamkey=snapshot.value;
      });
    });

    return temp;
  }
  void initState(){
    user= auth.currentUser;
    for(int a=0;a<widget.mylist.obj.length;a++){
      loadselection(widget.mylist.obj[a].eventKey,a);
      groupvalues.add(tempvalue);
    }
    for(int a=0;a<widget.mylist.obj.length;a++){
      model=new match_entry_model(groupvalues[a].toString(),"0",widget.mylist.obj[a].eventKey);
      matches.add(model);
    }

  //  mylist=fetch_matches();

  }

  setSelectedRadio(int val,int index) {
    setState(() {
      groupvalues[index] = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    print(temp);
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: widget.mylist.obj.length,
              separatorBuilder: (BuildContext context, int index)  {
                return SizedBox(height: 18,);
              },
              padding: EdgeInsets.only(bottom: 20),
              itemBuilder: (BuildContext context, int index) {


                return matchlistitem(index,widget.mylist.obj);
              },
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.green)),
              onPressed: () {


                _responsehanddle();

              },
              color: Colors.green,
              textColor: Colors.white,
              child: Text("Send Pools",
                  style: TextStyle(fontSize: 14)),
            ),
          ),
//
        ],
      ),
    );
  }
  Widget matchlistitem(int index,List<Result> object){
    return  Container(
// this is for
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(MyFlutterApp.clock,color: Colors.white,size: 15,),
                    Text(object[index].eventDate.toString().substring(0,10) + ' -'+object[index].eventTime.toString(),style: TextStyle(
                        fontFamily: "OpenSans",fontSize: 13
                    ),),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(MyFlutterApp.stadium,color: Colors.white,size: 15,),
                    Text(object[index].countryName,style: TextStyle(
                        fontFamily: "OpenSans",fontSize: 13
                    ),),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 05,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0,
                color:  Colors.white,
              ),
              borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
              color: Colors.white,
            ),

            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          Text(object[index].eventAwayTeam
                            ,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(.7),
                              fontSize: 13,
                              fontFamily: "OpenSans",
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                              height: 50,
                              width: 50,
                              child: Image.network(object[index].awayTeamLogo)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text("VS",
                            style: TextStyle(fontFamily: "pb",
                                fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          Text(object[index].eventHomeTeam
                            ,style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              fontFamily: "OpenSans",
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                              height: 50,
                              width: 50,
                              child: Image.network(object[index].homeTeamLogo)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),

          Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              color:  Color(0xFF212733).withOpacity(.8),
            ),

            child: Row(
              children: [
                Expanded(flex: 1,
                  child:  Container(
                    decoration: groupvalues[index]==int.parse(object[index].awayTeamKey) ? BoxDecoration(

                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),),
                      color: Color(0xFf1BE37E),
                    ):null,
                    child: Radio(

                      hoverColor: Colors.white,
                      activeColor: Colors.white,
                      focusColor: Colors.white,
                      value:int.parse(object[index].awayTeamKey),
                      groupValue: groupvalues[index],

                      onChanged: (val) {
                        Selectedvalue=val;
                        matches[index].swinteamkey=Selectedvalue.toString();
                        setSelectedRadio(val,index);
                      },
                    ),
                  ),),
                Expanded(flex: 1,
                  child:  Container(
                      decoration: groupvalues[index]==0 ? BoxDecoration(
                        color: Color(0xFf1BE37E),
                      ):null,
                      child: Column(
                        children: [
                          SizedBox(height: 02,),
                          Text("TIE",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(height: 03,),
                          Container(
                            height: 20,
                            child: Radio(
                              hoverColor: Colors.white,
                              activeColor: Colors.white,
                              focusColor: Colors.white,
                              value: 0,


                              groupValue: groupvalues[index],
                              onChanged: (val) {
                                Selectedvalue=val;

                                matches[index].swinteamkey=Selectedvalue.toString();

                                setSelectedRadio(val,index);
                              },
                            ),
                          ),
                        ],
                      )
                  ),),
                Expanded(flex: 1,
                  child:  Container(
                    decoration: groupvalues[index]==int.parse(object[index].homeTeamKey) ? BoxDecoration(

                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),),
                      color: Color(0xFf1BE37E),
                    ):null,
                    child: Radio(
                      hoverColor: Colors.white,
                      activeColor: Colors.white,
                      focusColor: Colors.white,
                      value:int.parse(object[index].homeTeamKey),
                      groupValue: groupvalues[index],
                      onChanged: (val) {
                        Selectedvalue=val;
                        matches[index].swinteamkey=Selectedvalue.toString();
                        setSelectedRadio(val,index);
                        //     print(matches[index].winteamkey);
                      },
                    ),
                  ),),


              ],
            ),

          ),

        ],

      ),
      decoration: BoxDecoration(

      ),
    );


  }



  Widget _responsehanddle(){
    showGeneralDialog(
      barrierLabel:"Error",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: 220,
              width: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: SvgPicture.asset(
                        "assets/dollar.svg",

                    ),
                  ),
                  SizedBox(height: 05,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("Please make sure you have selected all matches.",
                      style: TextStyle(
                        color: Color(0xff71828A),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:05,right: 05),
                    child: new Text("A 10\$ amount will be deducted for submitting picks.",
                      style: TextStyle(
                        color: Color(0xff71828A),
                        fontSize: 08,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.center,),
                  ),
                   SizedBox(height: 8,),
                   Padding(
                     padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Container(
                           height: 30,
                           width: 80,

                           child: RaisedButton(
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(4.0),
                               ),
                             onPressed: () {
                               Navigator.of(context).pop();
                             },
                             color: Colors.black.withOpacity(.7),
                             textColor: Colors.white,
                             child: Text("NO".toUpperCase(),
                                 style: TextStyle(fontSize: 14)),
                           ),
                         ),
                         Container(
                           height: 30,
                           width: 80,
                           child: RaisedButton(
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(4.0),
                                 ),
                             onPressed: () {
                               for(int a=0;a<matches.length;a++){
                                 insert_weekly_matches(widget.mylist.week,matches[a].matchid,matches[a],user.uid);
                               }
                               Navigator.of(context).pop();
                               firebasehanlder.pickmade(auth.currentUser.uid);
                               firebasehanlder.create_history_value(auth.currentUser.uid,"Played : " + widget.mylist.week);
                               _responsehandle(message("Successfully Submitted", Icons.check_circle, Colors.green));


                             },
                             color: Color(0xFf1BE37E),                           textColor: Colors.white,
                             child: Text("YES".toUpperCase(),
                                 style: TextStyle(fontSize: 14)),
                           ),
                         ),
                       ],
                     ),
                   )
                ],
              ),
              margin: EdgeInsets.only(bottom: 25, left: 10, right: 10,top: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );

  }


  Widget _responsehandle(Widget response){


    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: (){
            Navigator.pop(context);
            //Navigator.pop(context);
            return null;
          },
          child: GestureDetector(
            onTap:(){
              Navigator.pop(context);
              //Navigator.pop(context);
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
