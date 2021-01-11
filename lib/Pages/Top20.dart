import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Topusers extends StatefulWidget {
  @override
  _MyResultState createState() => _MyResultState();
}

class _MyResultState extends State<Topusers> {
  List<int> groupvalues=[];
  int selectedRadio=0;
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
                    Text("Your Points",textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "pb",
                          fontSize: 30
                      ),),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color(0xFf1BE37E),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child:Center(
                        child: Text("00",textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "pb",
                              fontSize: 40
                          ),),
                      ),

                    ),
                    SizedBox(height: 10,),
                    Text("Recent Results",textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "pb",
                          fontSize: 20
                      ),),
                    SizedBox(height: 05,),
                   Expanded(
                     child: ListView(
                       padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 78),

                       children: [
                         topmatchlist("No User","--","--","--"),
//                         topmatchlist("Hamza Ali","8","2","8"),
//                         topmatchlist("Usama Ali","7","3","7"),
//                         topmatchlist("Ahmar Ali","6","4","6"),
//                         topmatchlist("Niza Ali","5","5","5"),
//                         topmatchlist("Ahmar Ali","4","4","4"),
//                         topmatchlist("Niza Ali","3","3","3"),
//                         topmatchlist("Ahmar Ali","2","2","2"),
//                         topmatchlist("Niza Ali","1","1","1"),
                       ],
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
                  child: Stack(
                    children: [



                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child:  CircleAvatar(
                            radius: 50.0,
                            backgroundImage:
                            AssetImage("assets/boy.png"),
                            backgroundColor: Colors.transparent,
                          ),

                        ),
                        width: 70.0,
                        height: 70.0,
                        decoration: new BoxDecoration(
                          color: Colors.transparent,

                          borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 12.0,
                        child:
                        Text(index,textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "pb",
                              fontSize: 10
                          ),),
                        backgroundColor: Colors.white,
                      ),


                    ],
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
  Widget matchlistitem(int index){
    groupvalues.add(index);
    return Container(

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0,
                color: Colors.black.withOpacity(.7),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black.withOpacity(.7),
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
                          Text("QUERETARO"
                            ,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(.7),
                              fontSize: 13,
                              fontFamily: "OpenSans",
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                              height: 50,
                              width: 50,
                              child: Image.asset("assets/team.png")),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text("VS",
                            style: TextStyle(fontFamily: "pb", color: Color(0xFfa6a5a5),
                                fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          Text("SAINT LOUIS"
                            ,style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              fontFamily: "OpenSans",
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                              height: 50,
                              width: 50,
                              child: Image.asset("assets/team1.png")),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 60,right: 60,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Color(0xFF3c4456),
                            borderRadius: BorderRadius.all(Radius.circular(3)
                            )
                        ),
                        child:   Center(
                          child: Text("0",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "pb",
                                fontSize: 20,
                                color: Colors.white.withOpacity(.8)
                            ),),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Color(0xFF3c4456),
                            borderRadius: BorderRadius.all(Radius.circular(3)
                            )
                        ),
                        child:   Center(
                          child: Text("E",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "pb",
                                fontSize: 20,
                                color: Colors.white.withOpacity(.8)
                            ),),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFF3c4456),
                          borderRadius: BorderRadius.all(Radius.circular(3),
                          ),
                          border: Border.all(                              color:  Color(0xFf1BE37E),
                              width: 1
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:  Color(0xFf1BE37E),
                              spreadRadius: 2,
                              blurRadius: 5,
                              // changes position of shadow
                            ),
                          ],
                        ),
                        child:   Center(
                          child: Text("5",

                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "pb",
                                fontSize: 20,
                                color: Colors.white.withOpacity(.8)
                            ),),
                        ),


                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text("Points: +5",textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "pb",
                      fontSize: 20,
                      color: Colors.white.withOpacity(.5)
                  ),),
                SizedBox(height: 10,),
              ],
            ),
          ),



        ],

      ),
      decoration: BoxDecoration(

      ),
    );
  }
}
