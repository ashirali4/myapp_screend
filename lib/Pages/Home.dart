import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          color: Colors.black,
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: new AssetImage("assets/homebg.jpg"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                                    Text("QUERETARO"
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
                                        child: Image.asset("assets/team.png")),
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
                                    Text("SAINT LOUIS"
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
                                        child: Image.asset("assets/team1.png")),
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
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0,
                          color:  Color(0xFF212733).withOpacity(.8),
                        ),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color:  Color(0xFF212733).withOpacity(.8),
                      ),

                      child: Row(
                        children: [
                          Radio(),
                        ],
                      ),

                    ),

                  ],

                ),
                decoration: BoxDecoration(

                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
