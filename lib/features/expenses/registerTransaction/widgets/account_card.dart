import 'package:finance_with_notion/shared/widgets/forms_widget/dropdown/dropdown.dart';
import 'package:flutter/material.dart';

class AccountOrCardSelection extends StatelessWidget {
  const AccountOrCardSelection({Key? key, required this.selectOrigin})
      : super(key: key);
  final void Function(String value) selectOrigin;

  //TODO get categories from notion
  static const _options = ["Origin Opt1", "Origin opt2", "Origin opt3"];

  @override
  Widget build(BuildContext context) {
    return Dropdown(
      hintText: "Select account or card",
      options: _options,
      title: "Account/Card",
      linkButtonTitle: "Edit origin of expend",
      linkButtonAction: () => print("edit origin of expend"),
      selectOption: selectOrigin,
    );
  }
}
