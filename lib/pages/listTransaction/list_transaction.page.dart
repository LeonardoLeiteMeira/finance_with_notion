import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:finance_with_notion/shared/widgets/transaction_widget/transaction.widget.dart';

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
                  () => const CircularProgressIndicator(),
                  (data) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return TransactionWidget(
                            userTransaction: data?.elementAt(index),
                          );
                        },
                      )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: controller.test,
      ),
    );
  }
}
