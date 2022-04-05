import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:leo_financial/pages/initial/initial.controller.dart';
import 'package:leo_financial/shared/base/base.page.dart';
import 'package:leo_financial/shared/widgets/transaction_widget/transaction.widget.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState
    extends BaseStateWithController<InitialPage, InitialController> {
  @override
  void initState() {
    controller.getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          onPressed: controller.addTransaction,
        ),
      ),
    );
  }
}
