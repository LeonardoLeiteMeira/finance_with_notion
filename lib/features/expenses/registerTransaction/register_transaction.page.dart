import 'package:finance_with_notion/shared/widgets/forms_widget/cash_value/cash_value.dart';
import 'package:finance_with_notion/shared/widgets/forms_widget/dropdown/my_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../shared/models/enum/transaction_type.dart';
import '../../../shared/widgets/forms_widget/radio_button/radio_button.dart';
import 'register_transaction.controller.dart';
import 'widgets/select_category.dart';

class RegisterTransactionPage extends StatefulWidget {
  const RegisterTransactionPage({Key? key}) : super(key: key);

  @override
  State<RegisterTransactionPage> createState() =>
      _RegisterTransactionPageState();
}

class _RegisterTransactionPageState extends BaseStateWithController<
    RegisterTransactionPage, RegisterTransactionController> {
  final valueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void saveTransaction() {
    var result = _formKey.currentState!.validate();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Transaction")),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
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
                  const SizedBox(height: 5),
                  CashValue(
                    controller: valueController,
                  ),
                  const SizedBox(height: 5),
                  SelectCategory(
                      selectCategory: () => print("Select category")),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Colors.black,
                    endIndent: 20,
                    indent: 20,
                    thickness: 1,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    initialValue: "Dropdown To select transaction type",
                  ),
                  TextFormField(
                    initialValue: "Value",
                  ),
                  TextFormField(
                    initialValue: "Date - by default needs to be now",
                  ),
                  ElevatedButton(
                      onPressed: saveTransaction, child: const Text("Save"))
                ],
              ))),
    );
  }
}
