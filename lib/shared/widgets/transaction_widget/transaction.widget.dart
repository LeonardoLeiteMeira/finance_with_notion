import 'package:flutter/material.dart';
import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';

class TransactionWidget extends StatelessWidget {
  final UserTransaction _userTransaction;
  const TransactionWidget({Key? key, required userTransaction})
      : _userTransaction = userTransaction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var sideMargin = MediaQuery.of(context).size.width * 0.07;
    return Container(
      height: 65,
      margin: EdgeInsets.only(bottom: 18, left: sideMargin, right: sideMargin),
      decoration: BoxDecoration(
          color: Colors.blue[200], borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              getIcon(),
              const SizedBox(width: 15),
              getDescriptionAndDate()
            ],
          ),
          getValue()
        ],
      ),
    );
  }

  Widget getIcon() => Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.only(left: 13),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.green),
        child: _userTransaction.transactionType.getIcon(),
      );

  Widget getDescriptionAndDate() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _userTransaction.note,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(_userTransaction.date),
        ],
      );

  Widget getValue() => Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 13),
        width: 100,
        child: Text("\$${_userTransaction.value.toString()}"),
      );
}
