import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_type_base.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_properties_types_enum.dart';

class NotionNumber implements NotionTypeBase {
  @override
  String id;

  @override
  NotionPropertiesTypes type;

  @override
  double value;

  NotionNumber(this.id, this.type, this.value);

  NotionNumber.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        value = json["number"].toDouble(),
        type = NotionPropertiesTypes.number;
}
