import 'package:finance_with_notion/shared/widgets/forms_widget/base_dropdown/my_dropdown.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({
    Key? key,
    required this.selectOption,
    required this.options,
    required this.linkButtonTitle,
    required this.linkButtonAction,
    required this.title,
    required this.hintText,
  }) : super(key: key);
  final void Function(String value) selectOption;
  final List<String> options;
  final String linkButtonTitle;
  final Function linkButtonAction;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              InkWell(
                child: Text(
                  linkButtonTitle,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
                onTap: () => linkButtonAction(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        MyDropdown(
          hintText: hintText,
          options: options,
          onSelectedItemChanged: (index) => selectOption(options[index]),
        ),
      ],
    );
  }
}
