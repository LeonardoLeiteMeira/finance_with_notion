import 'package:finance_with_notion/features/expenses/listTransaction/list_transaction.page.dart';
import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'expenses.controller.dart';
import 'registerTransaction/register_transaction.page.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState
    extends BaseStateWithController<ExpensesPage, ExpensesController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Navigator(
              pages: [
                const MaterialPage(child: ListTransactionPage()),
                if (controller.createNewTransaction)
                  const MaterialPage(child: RegisterTransactionPage()),
              ],
              onPopPage: (Route route, result) {
                if (!route.didPop(result)) {
                  return false;
                }

                if (controller.createNewTransaction) {
                  controller.setCreateNewTransaction(false);
                }

                return true;
              },
            ));
  }
}
