import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_properties_types_enum.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_date.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_multi_select.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_number.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_rich_text.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_select.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_title.dart';

abstract class NotionTypeBase<T> {
  String? get id;
  T get value;
  NotionPropertiesTypes get type;

  Map<String, dynamic>? getPropertyInNotionJson(String key);

  static NotionTypeBase initNotionType<T>(
      {String? id, required NotionPropertiesTypes type, required T value}) {
    switch (type) {
      case NotionPropertiesTypes.title:
        return NotionTitle(id: id, type: type, value: value as String);

      case NotionPropertiesTypes.select:
        return NotionSelect(id: id, type: type, value: value as String);

      case NotionPropertiesTypes.richText:
        return NotionRichText(id: id, type: type, value: value as String);

      case NotionPropertiesTypes.number:
        return NotionNumber(id: id, type: type, value: value as double);

      case NotionPropertiesTypes.multiSelect:
        return NotionMultiSelect(
            id: id, type: type, value: value as List<String>);

      case NotionPropertiesTypes.date:
        return NotionDate(id: id, type: type, value: value as DateTime);

      default:
        throw ("Not implemented Notion Propertie Types");
    }
  }
}

/*
{
  "parent": {"database_id": "{{DATABASE_ID}}"},
  "properties": {
    "Name": {
      "title": [
        {
          "text": {"content": "{{July X}}"}
        }
      ]
    },
    "Type": {
      "select": {"name": "{{Credit}}"}
    },
    "Value": {"number": 250},
    "Category": {
      "select": {"name": "Party"}
    },
    "SecondaryCategory": {
      "multi_select": [
        {"name": "Party"}
      ]
    },
    "Date": {
      "date": {"start": "2023-03-03T17:30:00Z", "end": null}
    },
    "Location": {
      "rich_text": [
        {
          "text": {"content": "Postman"}
        }
      ]
    },
    "Note": {
      "rich_text": [
        {
          "text": {"content": "Uma nota importante"}
        }
      ]
    },
    "Account/Card": {
      "select": {"name": "NuConta"}
    }
  }
};
*/
