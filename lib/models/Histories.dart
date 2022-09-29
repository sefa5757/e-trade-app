import 'package:flutter/cupertino.dart';

class Histories {
  int id = 0;
  String name = "";
  String images="";
   Histories(this.name,this.images);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["images"]=images;
    return map;
  }

  Histories.fromObject(dynamic o) {
    id = o["id"];
    name = o["name"];
    images=o["images"];
  }
}
