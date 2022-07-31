import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_type_base.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_properties_types_enum.dart';

class NotionTitle implements NotionTypeBase {
  @override
  String id;

  @override
  NotionPropertiesTypes type;

  @override
  String value;

  NotionTitle(this.id, this.type, this.value);
  NotionTitle.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        type = NotionPropertiesTypes.title,
        value = __titleToListString(json);

  static String __titleToListString(Map<String, dynamic> titleProperty) {
    var titleList = titleProperty["title"];
    String title = "";
    for (var titleItem in titleList) {
      title += "${titleItem["plain_text"]} ";
    }

    return title;
  }
}
