import 'package:finance_with_notion/shared/widgets/forms_widget/dropdown/dropdown.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory(
      {Key? key,
      required this.selectCategory,
      this.isSeconderyCategory = false})
      : super(key: key);
  final void Function(String value) selectCategory;
  final bool isSeconderyCategory;

  //TODO get categories from notion
  static const _categories = ["Opt1", "opt2", "opt3"];

  @override
  Widget build(BuildContext context) {
    return Dropdown(
      hintText: "Select a category",
      options: _categories,
      title:
          "Expend ${isSeconderyCategory ? "Secondary category" : "category*"}",
      linkButtonTitle: "Edit Categories",
      linkButtonAction: () => print("edit categories"),
      selectOption: selectCategory,
    );
  }
}
