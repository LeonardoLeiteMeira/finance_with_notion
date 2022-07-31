import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_type_base.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_properties_types_enum.dart';

class NoptionRichText implements NotionTypeBase {
  @override
  String id;

  @override
  NotionPropertiesTypes type;

  @override
  String value;

  NoptionRichText(this.id, this.type, this.value);
  NoptionRichText.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        type = NotionPropertiesTypes.richText,
        value = _richTextToString(json);

  static String _richTextToString(Map<String, dynamic> richTextProperty) {
    var richTextList =
        richTextProperty[NotionPropertiesTypes.richText.nameInNotion] as List;

    String finaltext = "";
    for (var text in richTextList) {
      finaltext += "${text["plain_text"]}";
    }

    return finaltext;
  }
}
