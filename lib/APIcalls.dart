import 'package:firebase_database/firebase_database.dart';
import 'package:footballapp/model/load_matches_api_model.dart';
import 'package:http/http.dart' as http;

import 'model/match_entry_model.dart';
final databaseReference = FirebaseDatabase.instance.reference();

void insert_user_info(String uid,String email,String name){
  databaseReference.child("Users").child(uid).set({
    'uid': uid,
    'email': email,
    'name' : name
  });

}



void insert_weekly_matches(String week,String matchid,match_entry_model model,String uid){
  databaseReference.child("Users").child(uid).child(week).child(matchid).set({
    'winteamkey': model.winteamkey,
    'points' : "0"
  });

}

String get_name(String uid){
  String name;
  databaseReference.child("Users").child(uid).child("name").once().then((DataSnapshot snapshot) {
    name=snapshot.value;
    print(name);
    return name;
  });
}










Future<LoadMatchesApiModel> fetch_matches() async {
  String url= 'https://allsportsapi.com/api/football/?&met=Fixtures&leagueId=327&APIkey=8891d99d1401ee19c7ac9f93810467b422605da68e708f4e0d3f08a5b7597456&from=2020-10-28&to=2020-10-30';
  final response= await http.get(url);
  if(response.statusCode==200){
    final String responsestring=response.body;
    LoadMatchesApiModel list=loadMatchesApiModelFromJson(responsestring);
    return list;
  }
  else{
    final String responsestring=response.body;
    LoadMatchesApiModel list=loadMatchesApiModelFromJson(responsestring);

    return list;
  }
}