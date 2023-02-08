class Property {
  String? id;
  String? name;
  String? type;
  Map<String, dynamic>? propertyDetails;

  Property.fromJson(Map<String, dynamic> json) {
    if (json["id"] != null) {
      id = json["id"];
    }
    if (json["name"] != null) {
      name = json["name"];
    }
    if (json["type"] != null) {
      type = json["type"];
    }
    if (json[type] != null) {
      propertyDetails = json[type];
    }
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["type"] = type;
    data[type!] = propertyDetails;
    return data;
  }
}
