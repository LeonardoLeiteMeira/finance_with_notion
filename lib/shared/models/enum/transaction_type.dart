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
}
