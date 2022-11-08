import 'package:flutter/material.dart';
import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';
import 'package:finance_with_notion/shared/models/generic/date_extension.dart';

class TransactionWidget extends StatelessWidget {
  final double internalMargin = 13.0;
  final double cardHeight = 65;
  final double spaceBetweenCards = 18;
  final Color textColor = const Color(0xff313EB5);
  final Color cardColor = const Color(0xffFAF8F6);
  final UserTransaction _userTransaction;
  final double sideMargin;

  const TransactionWidget(
      {Key? key, required userTransaction, required this.sideMargin})
      : _userTransaction = userTransaction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      margin: EdgeInsets.only(
        bottom: spaceBetweenCards,
        left: sideMargin,
        right: sideMargin,
      ),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [iconCategoryAndDate(), valueAndNote()],
      ),
    );
  }

  Widget valueAndNote() => Container(
        margin: EdgeInsets.only(right: internalMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            textInValueAndNote(_userTransaction.valueAsCurrency),
            textInValueAndNote(_userTransaction.note)
          ],
        ),
      );

  Widget textInValueAndNote(String note) => Text(
        note,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 16, color: textColor),
      );

  Widget iconCategoryAndDate() => SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            expenseIcon(),
            const SizedBox(width: 8),
            categoryAndDate()
          ],
        ),
      );

  Widget expenseIcon() => Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.only(left: internalMargin),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: _userTransaction.transactionType.getColor(),
        ),
        child: _userTransaction.transactionType.getIcon(),
      );

  Widget categoryAndDate() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textInCategoryAndDate(_userTransaction.category),
          textInCategoryAndDate(_userTransaction.date.dayAndMonthFormat()),
        ],
      );

  Widget textInCategoryAndDate(String text) => Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: textColor),
      );
}
