import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_type_base.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_properties_types_enum.dart';

class NotionDate implements NotionTypeBase {
  @override
  String? id;

  @override
  NotionPropertiesTypes type;

  @override
  DateTime value;

  NotionDate({this.id, required this.type, required this.value});
  NotionDate.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        type = NotionPropertiesTypes.date,
        value = DateTime.parse(json["date"]["start"]);

  @override
  Map<String, dynamic> getPropertyInNotionJson(String key) {
    String date = value.toIso8601String();
    return {
      key: {
        "date": {"start": date, "end": null}
      },
    };
  }
}
