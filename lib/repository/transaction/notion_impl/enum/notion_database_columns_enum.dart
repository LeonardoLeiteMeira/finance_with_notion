import 'notion_properties_types_enum.dart';

enum NotionDatabaseColumns {
  name,
  type,
  value,
  category,
  secondaryCategory,
  date,
  location,
  note,
  account
}

extension NotionDatabaseColumnsName on NotionDatabaseColumns {
  String get nameInNotionDatabase {
    switch (this) {
      case NotionDatabaseColumns.name:
        return "Name";

      case NotionDatabaseColumns.type:
        return "Type";

      case NotionDatabaseColumns.value:
        return "Value";

      case NotionDatabaseColumns.category:
        return "Category";

      case NotionDatabaseColumns.secondaryCategory:
        return "SecondaryCategory";

      case NotionDatabaseColumns.date:
        return "Date";

      case NotionDatabaseColumns.location:
        return "Location";

      case NotionDatabaseColumns.note:
        return "Note";

      case NotionDatabaseColumns.account:
        return "Account/Card";
    }
  }

  NotionPropertiesTypes get notionType {
    switch (this) {
      case NotionDatabaseColumns.name:
        return NotionPropertiesTypes.title;

      case NotionDatabaseColumns.type:
        return NotionPropertiesTypes.select;

      case NotionDatabaseColumns.value:
        return NotionPropertiesTypes.number;

      case NotionDatabaseColumns.category:
        return NotionPropertiesTypes.select;

      case NotionDatabaseColumns.secondaryCategory:
        return NotionPropertiesTypes.select;

      case NotionDatabaseColumns.date:
        return NotionPropertiesTypes.date;

      case NotionDatabaseColumns.location:
        return NotionPropertiesTypes.richText;

      case NotionDatabaseColumns.note:
        return NotionPropertiesTypes.richText;

      case NotionDatabaseColumns.account:
        return NotionPropertiesTypes.select;
    }
  }
}
