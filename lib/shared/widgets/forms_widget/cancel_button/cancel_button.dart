import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  static const double _buttonWidth = 150;
  static const double _buttonHeigth = 60;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _buttonWidth,
      height: _buttonHeigth,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE30F0F),
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontSize: 16,
            ),
          )),
    );
  }
}
