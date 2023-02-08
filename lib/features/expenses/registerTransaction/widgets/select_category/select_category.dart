import 'package:finance_with_notion/features/expenses/registerTransaction/widgets/select_category/select_category_controller.dart';
import 'package:finance_with_notion/shared/widgets/forms_widget/dropdown/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory(
      {Key? key,
      required this.selectCategory,
      this.isSeconderyCategory = false})
      : super(key: key);
  final void Function(String value) selectCategory;
  final bool isSeconderyCategory;

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  late SelectCategoryController _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<SelectCategoryController>();
    _controller.readUserCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => _controller.isLoading
            ? const CircularProgressIndicator()
            : Dropdown(
                hintText: "Select a category",
                options: _controller.categories,
                title:
                    "Expend ${widget.isSeconderyCategory ? "Secondary category" : "category*"}",
                linkButtonTitle: "Edit Categories",
                linkButtonAction: () => print("edit categories"),
                selectOption: widget.selectCategory,
              ));
  }
}
