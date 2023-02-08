import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_database_metadata/property.dart';

import 'created_by.dart';
import 'title.dart';

class NotionDatabaseMetadata {
  String? object;
  String? id;
  String? createdTime;
  CreatedBy? createdBy;
  CreatedBy? lastEditedBy;
  String? lastEditedTime;
  List<Title>? title;
  List? description;
  bool? isInline;
  String? url;
  bool? archived;
  Map<String, Property>? properties;

  NotionDatabaseMetadata(
      {this.object,
      this.id,
      this.createdTime,
      this.createdBy,
      this.lastEditedBy,
      this.lastEditedTime,
      this.title,
      this.description,
      this.isInline,
      this.archived,
      this.url,
      this.properties});

  NotionDatabaseMetadata.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
    createdTime = json['created_time'];
    createdBy = json['created_by'] != null
        ? CreatedBy.fromJson(json['created_by'])
        : null;
    lastEditedBy = json['last_edited_by'] != null
        ? CreatedBy.fromJson(json['last_edited_by'])
        : null;
    lastEditedTime = json['last_edited_time'];
    if (json['title'] != null) {
      title = <Title>[];
      json['title'].forEach((v) {
        title!.add(Title.fromJson(v));
      });
    }
    if (json['description'] != null) {
      description = [];
      json['description'].forEach((v) {
        description!.add(v);
      });
    }
    isInline = json['is_inline'];
    if (json["url"] != null) {
      url = json["url"];
    }
    if (json["archived"] != null) {
      archived = json["archived"];
    }
    if (json["properties"] != null) {
      var propertiesObject = json["properties"] as Map<String, dynamic>;
      properties = <String, Property>{};
      for (var key in propertiesObject.keys) {
        var property = Property.fromJson(propertiesObject[key]);
        properties?.addAll({property.name!: property});
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['object'] = object;
    data['id'] = id;
    data['created_time'] = createdTime;
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson();
    }
    if (lastEditedBy != null) {
      data['last_edited_by'] = lastEditedBy!.toJson();
    }
    data['last_edited_time'] = lastEditedTime;
    if (title != null) {
      data['title'] = title!.map((v) => v.toJson()).toList();
    }
    if (description != null) {
      data['description'] = description!.map((v) => v.toJson()).toList();
    }
    data['is_inline'] = isInline;
    data["url"] = url;
    data["archived"] = archived;
    return data;
  }
}
