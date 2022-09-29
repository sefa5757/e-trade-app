import 'package:flutter/cupertino.dart';

class Products {
  int id = 0;
  String name = "";
  String price="";
  String image="";
   Products(this.name,this.price,this.image);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["price"]=price;
    map["image"]=image;
    return map;
  }

  Products.fromObject(dynamic o) {
    id = o["id"];
    name = o["name"];
    price=o["price"];
    image=o["image"];
  }
}
