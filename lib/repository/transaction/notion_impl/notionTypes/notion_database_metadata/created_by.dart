class CreatedBy {
  String? object;
  String? id;

  CreatedBy({this.object, this.id});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['object'] = object;
    data['id'] = id;
    return data;
  }
}
