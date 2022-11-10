import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onclick;
  final String text;
  final Color? color;
  final double? elevation;

  const MyButton(
      {Key? key, this.onclick, required this.text, this.color, this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color, elevation: elevation),
          onPressed: onclick,
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          )),
    );
  }
}
