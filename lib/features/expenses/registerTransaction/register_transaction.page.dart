import 'package:flutter/material.dart';
import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../../../shared/models/enum/transaction_type.dart';
import '../../../shared/widgets/forms_widget/radio_button/radio_button.dart';
import 'register_transaction.controller.dart';

class RegisterTransactionPage extends StatefulWidget {
  const RegisterTransactionPage({Key? key}) : super(key: key);

  @override
  State<RegisterTransactionPage> createState() =>
      _RegisterTransactionPageState();
}

class _RegisterTransactionPageState extends BaseStateWithController<
    RegisterTransactionPage, RegisterTransactionController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Transaction")),
      body: SingleChildScrollView(
          child: Form(
              child: Column(
        children: [
          Observer(
            builder: (_) => RadioButton(
              firstOption: TransactionType.credit.asString(),
              secondOption: TransactionType.debit.asString(),
              thirdOprion: TransactionType.revenue.asString(),
              selected: controller.transactionType.asString(),
              onChange: controller.setTransactionTypeFromString,
            ),
          ),
          TextFormField(
            initialValue: "Description",
          ),
          TextFormField(
            initialValue: "Dropdown To select transaction type",
          ),
          TextFormField(
            initialValue: "Value",
          ),
          TextFormField(
            initialValue: "Date - by default needs to be now",
          ),
        ],
      ))),
    );
  }
}
