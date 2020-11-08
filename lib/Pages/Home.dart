import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/Components/loader.dart';
import 'package:footballapp/Icons/my_flutter_app_icons.dart';
import 'package:footballapp/Pages/weekly_match_view.dart';
import 'package:footballapp/model/load_matches_api_model.dart';

import '../APIcalls.dart';
class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  @override
  Widget build(BuildContext context) {
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
                length: 6,
                child: new Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: new PreferredSize(
                    preferredSize: Size.fromHeight(40),
                    child: new Container(
                      child: new SafeArea(
                        child: Column(
                          children: <Widget>[
                            new TabBar(
                               indicatorColor: Color(0xFf1BE37E),
                               isScrollable: true,
                                tabs: [
                                tabbartext("JO1"),
                                tabbartext("JO2"),
                                tabbartext("JO3"),
                                tabbartext("JO4"),
                                tabbartext("JO4"),
                                tabbartext("JO6"),



                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  body: new TabBarView(
                    children: <Widget>[
                      Weekly_Match_View(),
                      new Column(
                        children: <Widget>[new Text("Lunches Page")],
                      ),
                      new Column(
                        children: <Widget>[new Text("Lunches Page")],
                      ),
                      new Column(
                        children: <Widget>[new Text("Lunches Page")],
                      ),
                      new Column(
                        children: <Widget>[new Text("Lunches Page")],
                      ),
                      new Column(
                        children: <Widget>[new Text("Cart Page")],
                      )
                    ],
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
