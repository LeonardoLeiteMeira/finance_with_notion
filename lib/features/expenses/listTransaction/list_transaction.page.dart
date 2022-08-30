import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:finance_with_notion/shared/widgets/transaction_widget/transaction.widget.dart';

import '../../../shared/models/user_transaction_list_model.dart';
import 'list_transaction.controller.dart';

class ListTransactionPage extends StatefulWidget {
  const ListTransactionPage({Key? key}) : super(key: key);

  @override
  State<ListTransactionPage> createState() => _ListTransactionPageState();
}

class _ListTransactionPageState extends BaseStateWithController<
    ListTransactionPage, ListTransactionController> {
  @override
  void initState() {
    controller.getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction List"),
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) => controller.userTransactionsState.handleState(
              loading,
              transactionWidgetList,
              (e) => Center(
                child: Text("Error $e"),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: controller.addTransaction,
      ),
    );
  }

  Widget transactionWidgetList(UserTransactionList? data) => ListView.builder(
        shrinkWrap: true,
        itemCount: data?.userTransactions.length ?? 0,
        itemBuilder: (context, index) {
          return TransactionWidget(
            userTransaction: data?.userTransactions.elementAt(index),
          );
        },
      );
}
