import 'package:finance_with_notion/features/expenses/registerTransaction/widgets/account_card/account_card_controller.dart';
import 'package:finance_with_notion/shared/widgets/forms_widget/dropdown/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AccountOrCardSelection extends StatefulWidget {
  final void Function(String value) selectOrigin;
  const AccountOrCardSelection({Key? key, required this.selectOrigin})
      : super(key: key);

  @override
  State<AccountOrCardSelection> createState() => _AccountOrCardSelectionState();
}

class _AccountOrCardSelectionState extends State<AccountOrCardSelection> {
  late AccountCardController _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<AccountCardController>();
    _controller.loadingAccountOrOrigins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => _controller.isLoading
            ? const CircularProgressIndicator()
            : Dropdown(
                hintText: "Select account or card",
                options: _controller.accountOrOrigins,
                title: "Account/Card",
                linkButtonTitle: "Edit origin of expend",
                linkButtonAction: () => print("edit origin of expend"),
                selectOption: widget.selectOrigin,
              ));
  }
}
