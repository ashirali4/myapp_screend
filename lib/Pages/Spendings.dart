import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../APIcalls.dart';
class Spendings extends StatefulWidget {
  @override
  _MyResultState createState() => _MyResultState();
}

class _MyResultState extends State<Spendings> {
  List<int> groupvalues=[];
  final FirebaseAuth auth = FirebaseAuth.instance;

  int selectedRadio=0;
  Future<void> firebasequery() async {
    await databaseReference.child("Users").child(auth.currentUser.uid).child("history").orderByChild("time").once();
  }
  setSelectedRadio(int val,int index) {
    setState(() {
      groupvalues[index] = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Color(0xFF3c4456),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 10,),

                    Text("Recent Spendings or Deposits",textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "pb",
                          fontSize: 20
                      ),),
                    SizedBox(height: 05,),
                    Expanded(
                      child: Container(

                        child: FirebaseAnimatedList(
                          query: databaseReference.child("Users").child(auth.currentUser.uid).child("history").orderByChild("sort"),
                          itemBuilder: (BuildContext context, DataSnapshot snapshot,
                              Animation<double> animation, int index) {
                            Map contact = snapshot.value;
                            return topmatchlistt(contact: contact);
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 05,),



                  ],
                ),
              ),
            ),
          )
      ),
    );
  }

  Widget topmatchlist(String username, String points, String index,String picks){
    return Padding(
      padding: const EdgeInsets.only(top: 03,bottom: 03),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color:  Color(0xFF212733),

        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 7,bottom: 7),
          child: Padding(
            padding: const EdgeInsets.only(left:12,right:12,top:8,bottom:08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Expanded(
                  flex: 03,
                  child:  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child:  Container(
                      width: 60,
                      height: 60,
                      child: SvgPicture.asset(
                        "assets/dollar.svg",

                      ),
                    ),

                  ),
                ),
                Expanded(
                  flex: 06,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(
                        username,
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      Text(
                        "Correct Picks : "+picks,
                        style: TextStyle(color: Colors.white.withOpacity(.7),
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 02,
                  child:  Text(points,textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "pb",
                        fontSize: 40
                    ),),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget topmatchlistt({Map contact}){
    return Padding(
      padding: const EdgeInsets.only(top: 03,bottom: 03),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color:  Color(0xFF212733),

        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 7,bottom: 7),
          child: Padding(
            padding: const EdgeInsets.only(left:12,right:12,top:8,bottom:08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Expanded(
                  flex: 03,
                  child:  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child:  Container(
                      width: 60,
                      height: 60,
                      child: SvgPicture.asset(
                        "assets/dollar.svg",

                      ),
                    ),

                  ),
                ),
                Expanded(
                  flex: 06,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(
                        contact['week'],
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      Text(
                        "Correct Picks : ",
                        style: TextStyle(color: Colors.white.withOpacity(.7),
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 02,
                  child:  Text(contact['cost'] + "\$",textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "pb",
                        fontSize: 20
                    ),),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }


}
