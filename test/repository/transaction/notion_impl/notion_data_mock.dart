import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';

var userTransactionList = [
  UserTransaction(
      "ddd22d8b-97dc-4bc2-a407-0ed6097d4792",
      "Bitcoin",
      2000,
      TransactionType.debt,
      "2022-07-04",
      "Investiment",
      ["Investiment"],
      "",
      "NuConta"),
  UserTransaction(
      "f8b651aa-4749-4c3b-8aa3-e6618982795c",
      "Aee",
      5000,
      TransactionType.credit,
      "2022-07-02",
      "Salary",
      ["Salary"],
      "",
      "Inter Account"),
  UserTransaction(
      "1177304b-ecc4-4b31-b7d0-1785d99a0ae1",
      "Uber to visit my mom",
      50,
      TransactionType.revenue,
      "2022-07-01",
      "Uber",
      ["Uber"],
      "",
      "C6 card"),
];

var databaseData = {
  "object": "list",
  "results": [
    {
      "object": "page",
      "id": "ddd22d8b-97dc-4bc2-a407-0ed6097d4792",
      "created_time": "2022-07-23T18:29:00.000Z",
      "last_edited_time": "2022-07-23T23:16:00.000Z",
      "created_by": {
        "object": "user",
        "id": "a8ad1dbc-aba1-48e8-9149-264771f07421"
      },
      "last_edited_by": {
        "object": "user",
        "id": "a8ad1dbc-aba1-48e8-9149-264771f07421"
      },
      "cover": null,
      "icon": null,
      "parent": {
        "type": "database_id",
        "database_id": "55443291-cb61-47f2-9b60-27a7ed9e6655"
      },
      "archived": false,
      "properties": {
        "Value": {"id": "%3Du%3B%5C", "type": "number", "number": 2000},
        "Note": {
          "id": "%40zUB",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {"content": "Bitcoin", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Bitcoin",
              "href": null
            }
          ]
        },
        "Date": {
          "id": "Au%3BB",
          "type": "date",
          "date": {"start": "2022-07-04", "end": null, "time_zone": null}
        },
        "Type": {
          "id": "BoVC",
          "type": "select",
          "select": {
            "id": "e57f9f70-ba83-4618-a6df-ad1fe240c360",
            "name": "Debit",
            "color": "default"
          }
        },
        "Origin": {
          "id": "CjOs",
          "type": "select",
          "select": {
            "id": "9a01a446-619a-4d0b-942e-bd6b48c40be4",
            "name": "NuConta",
            "color": "purple"
          }
        },
        "SecondaryCategory": {
          "id": "NzEg",
          "type": "multi_select",
          "multi_select": [
            {
              "id": "e0d18777-6792-43bb-a707-679aa4b16ad7",
              "name": "Investiment",
              "color": "brown"
            }
          ]
        },
        "Category": {
          "id": "qm%5B%3C",
          "type": "select",
          "select": {
            "id": "415b4b28-4e13-486d-a99b-b1e6269c1d0d",
            "name": "Investiment",
            "color": "brown"
          }
        },
        "Location": {"id": "~t%3C%5C", "type": "rich_text", "rich_text": []},
        "Name": {
          "id": "title",
          "type": "title",
          "title": [
            {
              "type": "text",
              "text": {"content": "July3", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "July3",
              "href": null
            }
          ]
        }
      },
      "url": "https://www.notion.so/July3-ddd22d8b97dc4bc2a4070ed6097d4792"
    },
    {
      "object": "page",
      "id": "f8b651aa-4749-4c3b-8aa3-e6618982795c",
      "created_time": "2022-07-23T18:29:00.000Z",
      "last_edited_time": "2022-07-31T14:29:00.000Z",
      "created_by": {
        "object": "user",
        "id": "a8ad1dbc-aba1-48e8-9149-264771f07421"
      },
      "last_edited_by": {
        "object": "user",
        "id": "a8ad1dbc-aba1-48e8-9149-264771f07421"
      },
      "cover": null,
      "icon": null,
      "parent": {
        "type": "database_id",
        "database_id": "55443291-cb61-47f2-9b60-27a7ed9e6655"
      },
      "archived": false,
      "properties": {
        "Value": {"id": "%3Du%3B%5C", "type": "number", "number": 5000},
        "Note": {
          "id": "%40zUB",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {"content": "Aee", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Aee",
              "href": null
            }
          ]
        },
        "Date": {
          "id": "Au%3BB",
          "type": "date",
          "date": {"start": "2022-07-02", "end": null, "time_zone": null}
        },
        "Type": {
          "id": "BoVC",
          "type": "select",
          "select": {
            "id": "f6517743-82f7-4325-8fc0-c91be8a68484",
            "name": "Credit",
            "color": "blue"
          }
        },
        "Origin": {
          "id": "CjOs",
          "type": "select",
          "select": {
            "id": "e0851744-19e8-43bb-9f8f-6d6ba5d001f9",
            "name": "Inter Account",
            "color": "orange"
          }
        },
        "SecondaryCategory": {
          "id": "NzEg",
          "type": "multi_select",
          "multi_select": [
            {
              "id": "daca0363-4099-4174-8c00-21a0adaa5d36",
              "name": "Salary",
              "color": "blue"
            }
          ]
        },
        "Category": {
          "id": "qm%5B%3C",
          "type": "select",
          "select": {
            "id": "7e48ddf5-029a-4284-b5e1-1f5d55218a07",
            "name": "Salary",
            "color": "blue"
          }
        },
        "Location": {"id": "~t%3C%5C", "type": "rich_text", "rich_text": []},
        "Name": {
          "id": "title",
          "type": "title",
          "title": [
            {
              "type": "text",
              "text": {"content": "July2", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "July2",
              "href": null
            }
          ]
        }
      },
      "url": "https://www.notion.so/July2-f8b651aa47494c3b8aa3e6618982795c"
    },
    {
      "object": "page",
      "id": "1177304b-ecc4-4b31-b7d0-1785d99a0ae1",
      "created_time": "2022-07-23T18:29:00.000Z",
      "last_edited_time": "2022-07-31T14:28:00.000Z",
      "created_by": {
        "object": "user",
        "id": "a8ad1dbc-aba1-48e8-9149-264771f07421"
      },
      "last_edited_by": {
        "object": "user",
        "id": "a8ad1dbc-aba1-48e8-9149-264771f07421"
      },
      "cover": null,
      "icon": null,
      "parent": {
        "type": "database_id",
        "database_id": "55443291-cb61-47f2-9b60-27a7ed9e6655"
      },
      "archived": false,
      "properties": {
        "Value": {"id": "%3Du%3B%5C", "type": "number", "number": 50},
        "Note": {
          "id": "%40zUB",
          "type": "rich_text",
          "rich_text": [
            {
              "type": "text",
              "text": {"content": "Uber to visit my mom", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "Uber to visit my mom",
              "href": null
            }
          ]
        },
        "Date": {
          "id": "Au%3BB",
          "type": "date",
          "date": {"start": "2022-07-01", "end": null, "time_zone": null}
        },
        "Type": {
          "id": "BoVC",
          "type": "select",
          "select": {
            "id": "ab1749a2-92f8-4c0b-9f26-e9f2d648ded3",
            "name": "Revenue",
            "color": "yellow"
          }
        },
        "Origin": {
          "id": "CjOs",
          "type": "select",
          "select": {
            "id": "fa01931a-6323-49f0-b33b-c0a632ec1fba",
            "name": "C6 card",
            "color": "default"
          }
        },
        "SecondaryCategory": {
          "id": "NzEg",
          "type": "multi_select",
          "multi_select": [
            {
              "id": "73445f2f-9a44-467f-b8bb-22c6e61c1358",
              "name": "Uber",
              "color": "default"
            }
          ]
        },
        "Category": {
          "id": "qm%5B%3C",
          "type": "select",
          "select": {
            "id": "3904a47f-8404-4d62-a925-992d4a8a54f0",
            "name": "Uber",
            "color": "default"
          }
        },
        "Location": {"id": "~t%3C%5C", "type": "rich_text", "rich_text": []},
        "Name": {
          "id": "title",
          "type": "title",
          "title": [
            {
              "type": "text",
              "text": {"content": "July1", "link": null},
              "annotations": {
                "bold": false,
                "italic": false,
                "strikethrough": false,
                "underline": false,
                "code": false,
                "color": "default"
              },
              "plain_text": "July1",
              "href": null
            }
          ]
        }
      },
      "url": "https://www.notion.so/July1-1177304becc44b31b7d01785d99a0ae1"
    }
  ],
  "next_cursor": null,
  "has_more": false,
  "type": "page",
  "page": {}
};
