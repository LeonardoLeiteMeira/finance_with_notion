import 'package:finance_with_notion/features/expenses/registerTransaction/widgets/account_card/account_card.dart';
import 'package:finance_with_notion/features/expenses/registerTransaction/widgets/note_text_field.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';
import 'package:finance_with_notion/shared/widgets/forms_widget/cancel_button/cancel_button.dart';
import 'package:finance_with_notion/shared/widgets/forms_widget/cash_value/cash_value.dart';
import 'package:finance_with_notion/shared/widgets/forms_widget/datetime_picker/my_datetime_picker.dart';
import 'package:finance_with_notion/shared/widgets/forms_widget/location_component/location_component.dart';
import 'package:finance_with_notion/shared/widgets/forms_widget/save_button/save_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../shared/models/enum/transaction_type.dart';
import '../../../shared/widgets/forms_widget/radio_button/radio_button.dart';
import 'register_transaction.controller.dart';
import 'widgets/select_category/select_category.dart';

class RegisterTransactionPage extends StatefulWidget {
  const RegisterTransactionPage({Key? key}) : super(key: key);

  @override
  State<RegisterTransactionPage> createState() =>
      _RegisterTransactionPageState();
}

class _RegisterTransactionPageState extends BaseStateWithController<
    RegisterTransactionPage, RegisterTransactionController> {
  final _formKey = GlobalKey<FormState>();

  final valueController = TextEditingController();
  final locationController = TextEditingController();
  final noteController = TextEditingController();
  String category = "";
  String seconderyCategory = "";
  String accountCardOrigin = "";

  TransactionType get transactionType => controller.transactionType;
  set transactionType(TransactionType value) =>
      controller.setTransactionType(value);

  DateTime get transactionDate => controller.transactionDate;
  set transactionDate(DateTime value) => controller.setTransactionDate(value);

  @override
  void initState() {
    super.initState();
  }

  void saveCallback() async {
    var isValid = _formKey.currentState!.validate();
    if (isValid) {
      await createNewTransaction();
    } else {
      showError("There are some incorret fields");
    }
  }

  Future<void> createNewTransaction() async {
    var newUserTransaction = UserTransaction(
        note: noteController.text,
        value: double.parse(valueController.text.replaceAll("€", "")),
        transactionType: transactionType,
        date: transactionDate,
        category: category,
        secondaryCategory: [seconderyCategory],
        location: locationController.text,
        origin: accountCardOrigin);

    var isSuccesss = await controller.saveNewTransaction(newUserTransaction);
    if (isSuccesss) {
      Navigator.pop(context);
    }
  }

  void showError(String errorMessage) {
    //TODO create default snackbar to show error
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorMessage),
    ));
  }

  @override
  Widget build(BuildContext context) {
    const double spaceBetweenFormItens = 12;
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Transaction")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: spaceBetweenFormItens),
              Observer(
                builder: (_) => RadioButton(
                  firstOption: TransactionType.credit.asString(),
                  secondOption: TransactionType.debit.asString(),
                  thirdOprion: TransactionType.revenue.asString(),
                  selected: transactionType.asString(),
                  onChange: (String value) =>
                      transactionType = stringToTransactionTypeEnum(value),
                ),
              ),
              const SizedBox(height: spaceBetweenFormItens),
              CashValue(controller: valueController),
              const SizedBox(height: spaceBetweenFormItens),
              SelectCategory(
                  selectCategory: (String value) => category = value),
              const SizedBox(height: spaceBetweenFormItens),
              const Divider(
                color: Colors.black,
                endIndent: 20,
                indent: 20,
                thickness: 1,
              ),
              const SizedBox(height: spaceBetweenFormItens),
              SelectCategory(
                  isSeconderyCategory: true,
                  selectCategory: (String value) => seconderyCategory = value),
              const SizedBox(height: spaceBetweenFormItens),
              Observer(
                builder: (_) => MyDatetimePicker(
                  modalMode: CupertinoDatePickerMode.date,
                  value: transactionDate,
                  onDateTimeChanged: (DateTime value) =>
                      transactionDate = value,
                ),
              ),
              const SizedBox(height: spaceBetweenFormItens),
              LocationComponent(
                textEditingController: locationController,
                setError: showError,
              ),
              const SizedBox(height: spaceBetweenFormItens),
              AccountOrCardSelection(
                  selectOrigin: (String value) => accountCardOrigin = value),
              const SizedBox(height: spaceBetweenFormItens),
              NoteTextField(textController: noteController),
              const SizedBox(height: spaceBetweenFormItens),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SaveButton(onPressed: saveCallback),
                  const SizedBox(width: 20),
                  const CancelButton()
                ],
              ),
              const SizedBox(height: spaceBetweenFormItens * 2),
            ],
          ),
        ),
      ),
    );
  }
}
