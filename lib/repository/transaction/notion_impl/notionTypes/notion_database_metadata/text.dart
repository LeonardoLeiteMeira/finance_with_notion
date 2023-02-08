class Text {
  String? content;
  String? link;

  Text({this.content, this.link});

  Text.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    link = json['link'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['link'] = link;
    return data;
  }
}
