class CarType {
  int id = 0;
  String name = "";
   CarType(this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["name"] = name;
    return map;
  }

  CarType.fromObject(dynamic o) {
    id = o["id"];
    name = o["name"];
  }
}
