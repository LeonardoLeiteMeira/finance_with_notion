import 'package:flutter/material.dart';

enum TransactionType { credit, debt, revenue }

extension TransactionTypeExtension on TransactionType {
  String description() {
    switch (this) {
      case TransactionType.credit:
        return "Credit card expenses";
      case TransactionType.debt:
        return "Debt expenses";
      case TransactionType.revenue:
        return "Any revenue that comes in";
    }
  }

  Icon getIcon() {
    IconData icon;
    switch (this) {
      case TransactionType.credit:
        icon = Icons.credit_card;
        break;
      case TransactionType.debt:
        icon = Icons.attach_money_rounded;
        break;
      case TransactionType.revenue:
        icon = Icons.arrow_circle_up_rounded;
        break;
    }
    return Icon(icon, color: Colors.white);
  }

  Color getColor() {
    switch (this) {
      case TransactionType.credit:
        return const Color(0xff313EB5);
      case TransactionType.debt:
        return const Color(0xff2F88D6);
      case TransactionType.revenue:
        return const Color(0xff2FD48D);
      default:
        return const Color(0xffFCFF79);
    }
  }
}

TransactionType stringToTransactionTypeEnum(String type) {
  switch (type) {
    case "Revenue":
      return TransactionType.revenue;

    case "Credit":
      return TransactionType.credit;

    case "Debit":
      return TransactionType.debt;
    default:
      return TransactionType.debt;
  }
}
