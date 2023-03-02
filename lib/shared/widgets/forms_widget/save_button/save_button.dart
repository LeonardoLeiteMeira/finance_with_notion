import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SaveButton extends StatelessWidget {
  final Function() onPressed;

  const SaveButton({Key? key, required this.onPressed}) : super(key: key);

  static const double _buttonWidth = 150;
  static const double _buttonHeigth = 60;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _buttonWidth,
      height: _buttonHeigth,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2FD48D)),
          onPressed: onPressed,
          child: const Text(
            "Save",
            style: TextStyle(
              fontSize: 16,
            ),
          )),
    );
  }
}
