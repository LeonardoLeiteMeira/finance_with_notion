import 'package:flutter/material.dart';
import 'package:leo_financial/shared/base/base.page.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register New Transaction")),
      body: SingleChildScrollView(
          child: Form(
              child: Column(
        children: [
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
