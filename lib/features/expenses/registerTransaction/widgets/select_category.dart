import 'package:finance_with_notion/shared/widgets/forms_widget/dropdown/my_dropdown.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory(
      {Key? key,
      required this.selectCategory,
      this.isSeconderyCategory = false})
      : super(key: key);
  final void Function() selectCategory;
  final bool isSeconderyCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Expend ${isSeconderyCategory ? "Secondary category" : "category*"}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              InkWell(
                child: const Text(
                  "Edit Categories",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onTap: () => print("edit categories"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        MyDropdown(
          hintText: "Select a category",
          options: const ["Opt1", "opt2", "opt3"],
          onSelectedItemChanged: (index) {
            print(index);
            selectCategory();
          },
        ),
      ],
    );
  }
}