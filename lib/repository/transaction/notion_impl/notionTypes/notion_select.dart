import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_type_base.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_properties_types_enum.dart';

class NotionSelect implements NotionTypeBase<String> {
  @override
  String? id;

  @override
  NotionPropertiesTypes type;

  @override
  String value;

  NotionSelect({this.id, required this.type, required this.value});
  NotionSelect.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        type = NotionPropertiesTypes.select,
        value = json["select"]?["name"] ?? "";

  @override
  Map<String, dynamic>? getPropertyInNotionJson(String key) {
    if (value == "") {
      return null;
    }

    return {
      key: {
        "select": {"name": value}
      },
    };
  }
}
