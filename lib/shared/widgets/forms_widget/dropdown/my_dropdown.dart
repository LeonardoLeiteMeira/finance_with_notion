import 'package:finance_with_notion/shared/widgets/forms_widget/dropdown/widgets/option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown(
      {Key? key,
      required this.options,
      this.dropdownContainerHeight,
      required this.onSelectedItemChanged,
      required this.hintText,
      this.selectedItem})
      : super(key: key);
  final List<String> options;
  final double? dropdownContainerHeight;
  final void Function(int) onSelectedItemChanged;
  final String hintText;
  final int? selectedItem;

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  int? selectedItem;

  @override
  void initState() {
    selectedItem = widget.selectedItem;
    super.initState();
  }

  void selectItem(int index) {
    setState(() {
      selectedItem = index;
    });
    widget.onSelectedItemChanged(index);
  }

  void onClickSelectButton(modalContext) {
    if (selectedItem == null) {
      setState(() {
        selectedItem = 0;
      });
    }
    selectedItem;
    Navigator.pop(modalContext);
  }

  void showOptions() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
          height: widget.dropdownContainerHeight ?? 300,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    child: const Text("Select"),
                    onPressed: () => onClickSelectButton(context),
                  ),
                ],
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 32,
                  onSelectedItemChanged: selectItem,
                  scrollController: selectedItem != null
                      ? FixedExtentScrollController(initialItem: selectedItem!)
                      : null,
                  children: List<Widget>.generate(
                    widget.options.length,
                    (index) => Text(
                      widget.options[index],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: InkWell(
        onTap: showOptions,
        child: DropdownOption(
          isHitText: selectedItem == null,
          text: selectedItem == null
              ? widget.hintText
              : widget.options[selectedItem!],
        ),
      ),
    );
  }
}
