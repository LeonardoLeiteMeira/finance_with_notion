enum NotionPropertiesTypes {
  title,
  richText,
  text,
  number,
  select,
  multiSelect,
  status,
  date,
  person,
  fileAndMedia,
  checkbox,
  url,
  email,
  phone
}

extension NotionPropertiesNames on NotionPropertiesTypes {
  String get nameInNotion {
    switch (this) {
      case NotionPropertiesTypes.title:
        return "title";
      case NotionPropertiesTypes.richText:
        return "rich_text";

      case NotionPropertiesTypes.text:
        return "text";

      case NotionPropertiesTypes.number:
        return "number";

      case NotionPropertiesTypes.select:
        return "select";

      case NotionPropertiesTypes.multiSelect:
        return "multi_select";

      case NotionPropertiesTypes.status:
        return "status"; //check

      case NotionPropertiesTypes.date:
        return "date";

      case NotionPropertiesTypes.person:
        return "person"; //check

      case NotionPropertiesTypes.fileAndMedia:
        return "file_and_midia"; //check

      case NotionPropertiesTypes.checkbox:
        return "checkbox"; //check

      case NotionPropertiesTypes.url:
        return "url"; //check

      case NotionPropertiesTypes.email:
        return "email"; //check

      case NotionPropertiesTypes.phone:
        return "phone"; //check
    }
  }
}
