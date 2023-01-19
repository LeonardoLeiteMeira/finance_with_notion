import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashValue extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CashValue({Key? key, required this.controller, this.validator})
      : super(key: key);

  @override
  State<CashValue> createState() => _CashValueState();
}

class _CashValueState extends State<CashValue> {
  //TODO read theme color
  static const Color _inputColor = Color.fromARGB(255, 47, 136, 214);

  @override
  void initState() {
    //
    super.initState();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Value*",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            decoration: const BoxDecoration(
              color: _inputColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: CupertinoTextFormFieldRow(
                padding: const EdgeInsets.all(10),
                validator: widget.validator,
                placeholder: "Insert value",
                placeholderStyle:
                    const TextStyle(color: Color.fromARGB(255, 203, 198, 198)),
                decoration: const BoxDecoration(
                  color: _inputColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                style: const TextStyle(color: Colors.white),
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                controller: widget.controller,
                //TODO set dynamic symbol
                inputFormatters: [
                  CurrencyTextInputFormatter(symbol: "€", enableNegative: false)
                ]),
          ),
        ],
      ),
    );
  }
}
