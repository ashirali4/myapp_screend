// To parse this JSON data, do
//
//     final linkApi = linkApiFromJson(jsonString);

import 'dart:convert';

LinkApi linkApiFromJson(String str) => LinkApi.fromJson(json.decode(str));

String linkApiToJson(LinkApi data) => json.encode(data.toJson());

class LinkApi {
  LinkApi({
    this.apiurl,
  });

  String apiurl;

  factory LinkApi.fromJson(Map<String, dynamic> json) => LinkApi(
    apiurl: json["apiurl"] == null ? null : json["apiurl"],
  );

  Map<String, dynamic> toJson() => {
    "apiurl": apiurl == null ? null : apiurl,
  };
}
