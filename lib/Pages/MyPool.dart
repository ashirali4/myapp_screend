import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/Components/loader.dart';
import 'package:footballapp/Icons/my_flutter_app_icons.dart';
import 'package:footballapp/Pages/weekly_match_view.dart';
import 'package:footballapp/model/load_matches_api_model.dart';
import 'package:footballapp/model/sender_fromweek_one.dart';

import '../APIcalls.dart';
import 'MypoolWeekl_match-view.dart';
class MyPool extends StatefulWidget {
  String k;
  static final GlobalKey<MyPoolState> staticGlobalKey =
  new GlobalKey<MyPoolState>();

  MyPool(this.k) : super(key: MyPool.staticGlobalKey);
  @override
  MyPoolState createState() => MyPoolState();

}

class MyPoolState extends State<MyPool> with TickerProviderStateMixin {
  TabController _tabController;
  Future<LoadMatchesApiModel> mylist;
  List<Result> lsitofmatchesr1=new List<Result>();
  List<Result> lsitofmatchesr2=new List<Result>();
  List<Result> lsitofmatchesr3=new List<Result>();
  List<Result> lsitofmatchesr4=new List<Result>();
  List<Result> lsitofmatchesr5=new List<Result>();
  List<Result> lsitofmatchesr6=new List<Result>();
  List<Result> lsitofmatchesr7=new List<Result>();
  List<Result> lsitofmatchesr8=new List<Result>();
  List<Result> lsitofmatchesr9=new List<Result>();
  List<Result> lsitofmatchesr10=new List<Result>();
  List<Result> lsitofmatchesr11=new List<Result>();
  List<Result> lsitofmatchesr12=new List<Result>();
  List<Result> lsitofmatchesr13=new List<Result>();
  List<Result> lsitofmatchesr14=new List<Result>();
  List<Result> lsitofmatchesr15=new List<Result>();
  List<Result> lsitofmatchesr16=new List<Result>();
  List<Result> lsitofmatchesr17=new List<Result>();


  @override
  void initState() {

    // TODO: implement initState
    _tabController = new TabController(length: 17, vsync: this, initialIndex: 1);

  }
  void refreshlist(){
   lsitofmatchesr1.clear();
   lsitofmatchesr2.clear();
   lsitofmatchesr3.clear();
   lsitofmatchesr4.clear();
   lsitofmatchesr5.clear();
   lsitofmatchesr6.clear();
   lsitofmatchesr7.clear();
   lsitofmatchesr8.clear();
   lsitofmatchesr10.clear();
   lsitofmatchesr11.clear();
   lsitofmatchesr12.clear();
   lsitofmatchesr13.clear();
   lsitofmatchesr14.clear();
   lsitofmatchesr15.clear();
   lsitofmatchesr16.clear();
   lsitofmatchesr17.clear();
   setState(() {

   });
  }
  @override
  Widget build(BuildContext context) {
    mylist=fetch_matches(widget.k);

    return SafeArea(
        child:Container(
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
            color: Colors.black,
            image: new DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.dstATop),
              image: new AssetImage("assets/homebg.jpg"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: new DefaultTabController(
              initialIndex: 16,
              length: 17,

              child: new Scaffold(
                backgroundColor: Colors.transparent,
                appBar: new PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: new Container(
                    child: new SafeArea(
                      child: Column(
                        children: <Widget>[
                          new TabBar(

                            indicatorColor: Colors.grey,
                            isScrollable: true,


                            tabs: [
                              tabbartext("Week-J01"),
                              tabbartext("Week-J02"),
                              tabbartext("Week-J03"),
                              tabbartext("Week-J04"),
                              tabbartext("Week-J05"),
                              tabbartext("Week-J06"),
                              tabbartext("Week-J07"),
                              tabbartext("Week-J08"),
                              tabbartext("Week-J09"),
                              tabbartext("Week-J10"),
                              tabbartext("Week-J11"),
                              tabbartext("Week-J12"),
                              tabbartext("Week-J13"),
                              tabbartext("Week-J14"),
                              tabbartext("Week-J15"),
                              tabbartext("Week-J16"),
                              tabbartext("Current Week Pool - J17"),





                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder<LoadMatchesApiModel>(
                    future: mylist, // a Future<String> or null
                    builder: (BuildContext context, AsyncSnapshot<LoadMatchesApiModel> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none: return new Text('Press button to start');
                        case ConnectionState.waiting: return Loaderfor();
                        default:
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
                          else{
                            for(int a=0;a<snapshot.data.result.length;a++){
                              if(snapshot.data.result[a].leagueRound=="Round 17"){
                                lsitofmatchesr17.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 16"){
                                lsitofmatchesr16.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 15"){
                                lsitofmatchesr15.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 14"){
                                lsitofmatchesr14.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 13"){
                                lsitofmatchesr13.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 12"){
                                lsitofmatchesr12.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 11"){
                                lsitofmatchesr11.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 10"){
                                lsitofmatchesr10.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 9"){
                                lsitofmatchesr9.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 8"){
                                lsitofmatchesr8.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 7"){
                                lsitofmatchesr7.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 6"){
                                lsitofmatchesr6.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 5"){
                                lsitofmatchesr5.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 4"){
                                lsitofmatchesr4.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 3"){
                                lsitofmatchesr3.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 2"){
                                lsitofmatchesr2.add(snapshot.data.result[a]);
                              }
                              else if(snapshot.data.result[a].leagueRound=="Round 1"){
                                lsitofmatchesr1.add(snapshot.data.result[a]);
                              }

                            }
                            if(lsitofmatchesr1.isEmpty){
                              return Loaderfor();
                            }
                            else{

                              sender week1=new sender(lsitofmatchesr1, "J01");
                              sender week2=new sender(lsitofmatchesr2, "J02");
                              sender week3=new sender(lsitofmatchesr3, "J03");
                              sender week4=new sender(lsitofmatchesr4, "J04");
                              sender week5=new sender(lsitofmatchesr5, "J05");
                              sender week6=new sender(lsitofmatchesr6, "J06");
                              sender week7=new sender(lsitofmatchesr7, "J07");
                              sender week8=new sender(lsitofmatchesr8, "J08");
                              sender week9=new sender(lsitofmatchesr8, "J09");
                              sender week10=new sender(lsitofmatchesr10, "J10");
                              sender week11=new sender(lsitofmatchesr11, "J11");
                              sender week12=new sender(lsitofmatchesr12, "J12");
                              sender week13=new sender(lsitofmatchesr13, "J13");
                              sender week14=new sender(lsitofmatchesr14, "J14");
                              sender week15=new sender(lsitofmatchesr15, "J15");
                              sender week16=new sender(lsitofmatchesr16, "J16");
                              sender week17=new sender(lsitofmatchesr17, "J17");



                              return new TabBarView(

                                children: <Widget>[
                                  Pool_Weekly_Match_View(week1),
                                  Pool_Weekly_Match_View(week2),
                                  Pool_Weekly_Match_View(week3),
                                  Pool_Weekly_Match_View(week4),
                                  Pool_Weekly_Match_View(week5),
                                  Pool_Weekly_Match_View(week6),
                                  Pool_Weekly_Match_View(week7),
                                  Pool_Weekly_Match_View(week8),
                                  Pool_Weekly_Match_View(week9),
                                  Pool_Weekly_Match_View(week10),
                                  Pool_Weekly_Match_View(week11),
                                  Pool_Weekly_Match_View(week12),
                                  Pool_Weekly_Match_View(week13),
                                  Pool_Weekly_Match_View(week14),
                                  Pool_Weekly_Match_View(week15),
                                  Pool_Weekly_Match_View(week16),
                                  Pool_Weekly_Match_View(week17),






                                ],
                              );
                            }

                          }


                      }
                    },
                  ),
                ),
              ),
            ),

          ),
        )
    );
  }

  Widget tabbartext(String text){
    return  Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: new Text(text,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: "OpenSans"
        ),),
    );
  }


}
