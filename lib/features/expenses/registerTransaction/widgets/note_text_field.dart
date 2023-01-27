import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteTextField extends StatefulWidget {
  const NoteTextField({Key? key, required this.textController, this.validator})
      : super(key: key);
  final TextEditingController textController;
  final String? Function(String?)? validator;

  @override
  State<NoteTextField> createState() => _NoteTextFieldState();
}

class _NoteTextFieldState extends State<NoteTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Note:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            CupertinoTextFormFieldRow(
              validator: widget.validator,
              controller: widget.textController,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: const Color(0xffF6F6F6)),
              maxLines: 5,
            ),
          ],
        ));
  }
}
