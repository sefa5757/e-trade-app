class Brands {
  int id = 0;
  String name = "";
   Brands(this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["name"] = name;
    return map;
  }

  Brands.fromObject(dynamic o) {
    id = o["id"];
    name = o["name"];
  }
}
