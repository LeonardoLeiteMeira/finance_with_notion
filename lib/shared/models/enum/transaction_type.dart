enum TransactionType { CREDIT, DEBT, REVENUE }

extension TransactionTypeExtension on TransactionType {
  String description() {
    switch (this) {
      case TransactionType.CREDIT:
        return "Credit card expenses";
      case TransactionType.DEBT:
        return "Debt expenses";
      case TransactionType.REVENUE:
        return "Any revenue that comes in";
    }
  }
}
