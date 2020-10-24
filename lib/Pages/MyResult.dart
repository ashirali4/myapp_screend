import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyResult extends StatefulWidget {
  @override
  _MyResultState createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {
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
                  Text("This Week Points",textAlign: TextAlign.start,
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
                      child: Text("68",textAlign: TextAlign.start,
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

                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color(0xFfa6a5a5),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child:Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Weekly Correct Picks",textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "pb",
                                  fontSize: 18
                              ),),
                            Text("14",textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "pb",
                                  fontSize: 25
                              ),),
                          ],
                        )
                    ),

                  ),
                  SizedBox(height: 05,),
                  Text("Your Matches",textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "pb",
                        fontSize: 20
                    ),),
                  SizedBox(height: 15,),
                  Expanded(
                    child: ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 5,
                      separatorBuilder: (BuildContext context, int index)  {
                        return SizedBox(height: 15,);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return matchlistitem(index);
                      },
                    ),
                  ),


                ],
              ),
            ),
          ),
        )
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
