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
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.green),
        child: _userTransaction.transactionType.getIcon(),
      );

  Widget getDescriptionAndDate() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _userTransaction.note,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(_userTransaction.date),
        ],
      );

  Widget getValue() => SizedBox(
        width: 70,
        child: Text(_userTransaction.value.toString()),
      );
}
