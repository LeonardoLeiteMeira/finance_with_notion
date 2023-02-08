import 'annotations.dart';
import 'text.dart';

class Title {
  String? type;
  Text? text;
  Annotations? annotations;
  String? plainText;
  String? href;

  Title({this.type, this.text, this.annotations, this.plainText, this.href});

  Title.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'] != null ? Text.fromJson(json['text']) : null;
    annotations = json['annotations'] != null
        ? Annotations.fromJson(json['annotations'])
        : null;
    plainText = json['plain_text'];
    href = json['href'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (text != null) {
      data['text'] = text!.toJson();
    }
    if (annotations != null) {
      data['annotations'] = annotations!.toJson();
    }
    data['plain_text'] = plainText;
    data['href'] = href;
    return data;
  }
}
