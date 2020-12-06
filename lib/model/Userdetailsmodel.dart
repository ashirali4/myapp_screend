import 'package:firebase_database/firebase_database.dart';

class Userdetailmodel {
  String email;
  String balance;
  String name;

  Userdetailmodel(this.email, this.balance, this.name);

  Userdetailmodel.fromSnapshot(DataSnapshot snapshot) :
        email = snapshot.value["email"],
        balance = snapshot.value["balance"],
        name = snapshot.value["name"];

  toJson() {
    return {
      "email": email,
      "balance": balance,
      "name": name,
    };
  }
}