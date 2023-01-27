import 'package:flutter/material.dart';
import 'dart:math' as math;

class DropdownOption extends StatelessWidget {
  const DropdownOption({Key? key, required this.isHitText, required this.text})
      : super(key: key);
  final bool isHitText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 26,
      child: Row(
        children: [
          isHitText
              ? Transform.rotate(
                  angle: -math.pi / 2,
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.grey[400],
                  ))
              : const SizedBox(),
          Text(
            text,
            style: TextStyle(
              color: isHitText ? Colors.grey[400] : Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
