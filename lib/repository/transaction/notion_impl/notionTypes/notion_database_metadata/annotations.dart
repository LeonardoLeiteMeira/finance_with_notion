class Annotations {
  bool? bold;
  bool? italic;
  bool? strikethrough;
  bool? underline;
  bool? code;
  String? color;

  Annotations(
      {this.bold,
      this.italic,
      this.strikethrough,
      this.underline,
      this.code,
      this.color});

  Annotations.fromJson(Map<String, dynamic> json) {
    bold = json['bold'];
    italic = json['italic'];
    strikethrough = json['strikethrough'];
    underline = json['underline'];
    code = json['code'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bold'] = bold;
    data['italic'] = italic;
    data['strikethrough'] = strikethrough;
    data['underline'] = underline;
    data['code'] = code;
    data['color'] = color;
    return data;
  }
}
