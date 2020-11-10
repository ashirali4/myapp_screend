import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/Components/loader.dart';
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
  match_entry_model model;
  int selectedRadio=0;
  void initState(){
    user= auth.currentUser;
  //  mylist=fetch_matches();

  }
  setSelectedRadio(int val,int index) {
    setState(() {
      groupvalues[index] = val;
    });
  }
  @override
  Widget build(BuildContext context) {
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
                model=new match_entry_model(Selectedvalue.toString(),"0",widget.mylist.obj[index].eventKey);
                matches.add(model);

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

                for(int a=0;a<matches.length;a++){
                //  print(matches[a].winteamkey);
                  insert_weekly_matches(widget.mylist.week,matches[a].matchid,matches[a],user.uid);
                }

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
    groupvalues.add(int.parse(object[index].eventKey));
    print('adding agin');
    print(matches[index].winteamkey);
    return Container(
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
                    Text(object[index].eventDate.toString(),style: TextStyle(
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
                        matches[index].swinteamkey=val.toString();
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

                                matches[index].swinteamkey=val.toString();

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
                        matches[index].swinteamkey=val.toString();
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
}
