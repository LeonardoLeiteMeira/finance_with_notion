import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_properties_types_enum.dart';

abstract class NotionTypeBase {
  String get id;
  // ignore: always_declare_return_types
  get value;
  NotionPropertiesTypes get type;
}
