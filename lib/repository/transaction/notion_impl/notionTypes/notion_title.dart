import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_database_columns_enum.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_type_base.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_properties_types_enum.dart';

class NotionTitle implements NotionTypeBase<String> {
  @override
  String? id;

  @override
  NotionPropertiesTypes type;

  @override
  String value;

  NotionTitle({this.id, required this.type, required this.value});
  NotionTitle.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        type = NotionPropertiesTypes.title,
        value = _titleToListString(json);

  static String _titleToListString(Map<String, dynamic> titleProperty) {
    var titleList = titleProperty["title"];
    String title = "";
    for (var titleItem in titleList) {
      title += "${titleItem["plain_text"]} ";
    }

    return title;
  }

  @override
  Map<String, dynamic>? getPropertyInNotionJson(String key) {
    if (value == "") {
      return null;
    }
    return {
      key: {
        "title": [
          {
            "text": {"content": value}
          }
        ]
      }
    };
  }
}
