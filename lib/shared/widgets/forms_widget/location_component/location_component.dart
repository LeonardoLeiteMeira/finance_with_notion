import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'location_component_controller.dart';

class LocationComponent extends StatefulWidget {
  final TextEditingController? textEditingController;
  const LocationComponent({Key? key, this.textEditingController})
      : super(key: key);

  @override
  State<LocationComponent> createState() => _LocationComponentState();
}

class _LocationComponentState extends State<LocationComponent> {
  late LocationComponentController _controller;
  //TODO read theme color
  static const Color _inputColor = Color.fromARGB(255, 47, 136, 214);

  @override
  void initState() {
    _controller = GetIt.I.get<LocationComponentController>();
    if (widget.textEditingController != null) {
      _controller.textController = widget.textEditingController!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Location:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: _inputColor,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: IconButton(
                      onPressed: () {
                        //TODO set value
                        _controller
                            .getLocationText()
                            .then((value) => print(value));
                      },
                      icon: const Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0x00f6f6f6),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black)),
                    child: CupertinoTextFormFieldRow(
                      textInputAction: TextInputAction.done,
                      controller: _controller.textController,
                      placeholder: "Location",
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
