import 'package:firebase_database/firebase_database.dart';
import 'package:footballapp/model/load_matches_api_model.dart';
import 'package:http/http.dart' as http;

import 'model/LinkAPImodel.dart';
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





Future<LinkApi> fetchlink() async {
  final response= await http.get('https://quinielafutbolera.com/api.php');
  if(response.statusCode==200){
    final String responsestring=response.body;
    LinkApi list=linkApiFromJson(responsestring);
    return list;
  }
  else{
    final String responsestring=response.body;
    LinkApi list=linkApiFromJson(responsestring);

    return list;
  }
}





Future<LoadMatchesApiModel> fetch_matches(String url) async {
 // String url= 'https://allsportsapi.com/api/football/?&met=Fixtures&leagueId=327&APIkey=d68c026db9679d97be692e05553aa0846b8ee3e2bfdcf362fdf951e562f3dd6c&from=2020-07-24&to=2020-12-01';
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


class firebasehanlder{
  static int balance=0;
  static int getbalnce(){
    return balance;
  }
  static void setbalance(String b){
     balance=int.parse(b);
  }

  static void pickmade(){
    balance=balance-10;
  }
}