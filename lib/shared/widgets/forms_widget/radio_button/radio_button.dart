import 'package:finance_with_notion/shared/widgets/my_button/my_button.dart';
import 'package:flutter/material.dart';

class RadioButton extends FormField<String> {
  final String firstOption;
  final String secondOption;
  final String thirdOprion;
  final String selected;
  final double? sideMargin;
  final void Function(String value) onChange;

  //TODO read theme color
  static const _selectedColor = Color.fromARGB(255, 47, 136, 214);
  static const _unselectedColor = Color.fromARGB(255, 108, 170, 224);

  RadioButton({
    key,
    void Function(String?)? onSaved,
    String? Function(String?)? validator,
    this.sideMargin,
    required this.firstOption,
    required this.secondOption,
    required this.onChange,
    required this.selected,
    required this.thirdOprion,
  })  : assert(selected == firstOption ||
            selected == secondOption ||
            thirdOprion == selected),
        super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            builder: (FormFieldState<String> field) {
              // final RadioButtonState state = field as RadioButtonState;

              return Container(
                margin: EdgeInsets.only(
                    left: sideMargin ?? 20, right: sideMargin ?? 20),
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "Type*",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _myButton(
                            firstOption, firstOption == selected, onChange),
                        _myButton(
                            secondOption, secondOption == selected, onChange),
                        _myButton(
                            thirdOprion, thirdOprion == selected, onChange),
                      ],
                    ),
                  ],
                ),
              );
            });
  static Widget _myButton(
          String option, bool isSelected, void Function(String) onclick) =>
      MyButton(
        text: option,
        onclick: () => onclick(option),
        color: isSelected ? _selectedColor : _unselectedColor,
        elevation: isSelected ? 7 : 1,
      );

  @override
  FormFieldState<String> createState() => RadioButtonState();
}

class RadioButtonState extends FormFieldState<String> {
  @override
  RadioButton get widget => super.widget as RadioButton;
}

//---------------------
// class SingleSelectForm extends FormField<Choice> {
//   final String titleText;
//   final String hintText;
//   final bool required;
//   final bool isRequired;
//   final String errorText;
//   final Choice initialValue;
//   final List<Choice> dataSource;
//   final Function(Choice) onChanged;

//   SingleSelectForm({
//     Key? key,
//     required FormFieldValidator<dynamic> validator,
//     required FormFieldSetter<Choice> onSaved,
//     this.isRequired = false,
//     this.titleText = 'Title',
//     this.hintText = 'Select one option',
//     this.required = false,
//     this.errorText = 'Please select one option',
//     required this.initialValue,
//     required this.dataSource,
//     required this.onChanged,
//   }) : super(
//           key: key,
//           onSaved: onSaved,
//           validator: validator,
//           initialValue: initialValue,
//           builder: (FormFieldState<Choice> field) {
//             final SingleSelectFormState state = field as SingleSelectFormState;
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: RichText(
//                     text: TextSpan(
//                         style: const TextStyle(fontSize: 14),
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: titleText,
//                               style: const TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold)),
//                           TextSpan(
//                             text: (isRequired) ? " *" : "",
//                             style: const TextStyle(
//                                 fontSize: 14, color: Colors.red),
//                           )
//                         ]),
//                   ),
//                 ),
//                 GridView(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 3,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16),
//                   children: dataSource
//                       .map((e) => GestureDetector(
//                           onTap: () {
//                             state.didChange(e);
//                             if (onChanged != null) onChanged(e);
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                               color:
//                                   state.value == e ? Colors.blue : Colors.white,
//                             ),
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               e.label,
//                               style: state.value == e
//                                   ? const TextStyle(color: Colors.white)
//                                   : const TextStyle(color: Colors.black),
//                             ),
//                           )))
//                       .toList(),
//                 ),
//                 SizedBox(height: state.hasError ? 5.0 : 0.0),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 16),
//                   child: Text(
//                     state.hasError ? (state.errorText ?? "Error") : '',
//                     style: TextStyle(
//                         color: Colors.redAccent.shade700,
//                         fontSize: state.hasError ? 12.0 : 0.0),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 )
//               ],
//             );
//           },
//         );

//   @override
//   FormFieldState<Choice> createState() => SingleSelectFormState();
// }

// class SingleSelectFormState extends FormFieldState<Choice> {
//   @override
//   SingleSelectForm get widget => super.widget as SingleSelectForm;
// }

// class Choice {
//   final String label;
//   final String id;

//   Choice({required this.label, required this.id});
// }
