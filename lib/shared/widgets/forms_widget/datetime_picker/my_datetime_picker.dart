import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finance_with_notion/shared/models/generic/date_extension.dart';
import 'dart:math' as math;

class MyDatetimePicker extends StatefulWidget {
  final void Function(DateTime) onDateTimeChanged;
  final DateTime value;
  final CupertinoDatePickerMode modalMode;

  const MyDatetimePicker({
    Key? key,
    required this.onDateTimeChanged,
    required this.value,
    required this.modalMode,
  }) : super(key: key);

  @override
  State<MyDatetimePicker> createState() => _MyDatetimePickerState();
}

class _MyDatetimePickerState extends State<MyDatetimePicker> {
  void showModal() => showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: MediaQuery.of(context).size.height / 2.5,
            padding: const EdgeInsets.only(top: 6.0),
            child: SafeArea(
              child: Stack(
                children: [
                  CupertinoDatePicker(
                    mode: widget.modalMode,
                    initialDateTime: widget.value,
                    use24hFormat: true,
                    onDateTimeChanged: widget.onDateTimeChanged,
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: CupertinoButton(
                        child: const Text("Select"),
                        onPressed: () {
                          //
                          Navigator.of(context).pop();
                        },
                      )),
                ],
              ),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Date:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: InkWell(
              child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Transform.rotate(
                          angle: -math.pi / 2,
                          child: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          )),
                      Text(
                        widget.value.fullFormatDate(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  )),
              onTap: showModal,
            ),
          ),
        ],
      ),
    );
  }
}
