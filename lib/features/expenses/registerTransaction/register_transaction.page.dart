import 'package:finance_with_notion/features/expenses/registerTransaction/widgets/account_card/account_card.dart';
import 'package:finance_with_notion/features/expenses/registerTransaction/widgets/note_text_field.dart';
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
  final valueController = TextEditingController();
  final locationController = TextEditingController();
  final noteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void saveTransaction() {
    var result = _formKey.currentState!.validate();
    print(result);
  }

  void showError(String errorMessage) {
    //TODO create default snackbar to show error
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorMessage),
    ));
  }

  TextStyle buttonTextStyle() => const TextStyle(
        fontSize: 16,
      );

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
                  selected: controller.transactionType.asString(),
                  onChange: controller.setTransactionTypeFromString,
                ),
              ),
              const SizedBox(height: spaceBetweenFormItens),
              CashValue(controller: valueController),
              const SizedBox(height: spaceBetweenFormItens),
              SelectCategory(selectCategory: controller.setCategory),
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
                  selectCategory: controller.setSecondaryCategory),
              const SizedBox(height: spaceBetweenFormItens),
              Observer(
                builder: (_) => MyDatetimePicker(
                  modalMode: CupertinoDatePickerMode.date,
                  value: controller.transactionDate,
                  onDateTimeChanged: (DateTime value) =>
                      controller.setTransactionDate(value),
                ),
              ),
              const SizedBox(height: spaceBetweenFormItens),
              LocationComponent(
                textEditingController: locationController,
                setError: showError,
              ),
              const SizedBox(height: spaceBetweenFormItens),
              AccountOrCardSelection(
                  selectOrigin: (String value) => print(value)),
              const SizedBox(height: spaceBetweenFormItens),
              NoteTextField(textController: noteController),
              const SizedBox(height: spaceBetweenFormItens),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SaveButton(onPressed: saveTransaction),
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
