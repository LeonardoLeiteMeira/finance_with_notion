import 'package:finance_with_notion/features/expenses/listTransaction/list_transaction.page.dart';
import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:flutter/material.dart';

import 'expenses.controller.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState
    extends BaseStateWithController<ExpensesPage, ExpensesController> {
  @override
  void initState() {
    controller.appDataState.handleReactionState(successResult: (_) {
      //TODO Navigate do list transaction page
      print("navigate");
    });
    controller.initiApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: const [
        MaterialPage(child: ListTransactionPage()),
        // CupertinoPage(child: RegisterTransactionPage())
      ],
      onPopPage: (Route route, result) => route.didPop(result),
    );
  }
}
