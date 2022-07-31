import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_type_base.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_properties_types_enum.dart';

class NotionDate implements NotionTypeBase {
  @override
  String id;

  @override
  NotionPropertiesTypes type;

  @override
  String value;

  NotionDate(this.id, this.type, this.value);
  NotionDate.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        type = NotionPropertiesTypes.date,
        value = json["date"]["start"];
}
