import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CashValue extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;

  const CashValue({Key? key, this.controller, this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
          initialValue: initialValue,
          keyboardType: const TextInputType.numberWithOptions(
              decimal: true, signed: false),
          controller: controller,
          //TODO set dynamic symbol
          inputFormatters: [CurrencyTextInputFormatter(symbol: "€")]),
    );
  }
}
