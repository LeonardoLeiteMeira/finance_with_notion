import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_type_base.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_properties_types_enum.dart';

class NotionMultiSelect implements NotionTypeBase {
  @override
  String? id;

  @override
  NotionPropertiesTypes type;

  @override
  List<String> value;

  NotionMultiSelect({this.id, required this.type, required this.value});
  NotionMultiSelect.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        type = NotionPropertiesTypes.multiSelect,
        value = __multiSelectToListString(json);

  static List<String> __multiSelectToListString(
      Map<String, dynamic> multiSelectProperty) {
    var selectList = multiSelectProperty["multi_select"] as List;
    var selectValues = <String>[];

    for (var element in selectList) {
      selectValues.add(element["name"]);
    }
    return selectValues;
  }

  @override
  Map<String, dynamic>? getPropertyInNotionJson(String key) {
    dynamic checkedValue;
    if (_isValueEmpty()) {
      return null;
    } else {
      checkedValue = (value.map((e) => {"name": e})).toList();
    }
    return {
      key: {"multi_select": checkedValue},
    };
  }

  bool _isValueEmpty() {
    if (value.isEmpty) {
      return true;
    } else if (value.first == "") {
      return true;
    }

    return false;
  }
}
