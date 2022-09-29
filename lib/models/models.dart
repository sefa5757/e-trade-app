class Models {
  int id = 0;
  String name = "";
   Models(this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["name"] = name;
    return map;
  }

  Models.fromObject(dynamic o) {
    id = o["id"];
    name = o["name"];
  }
}
