import 'package:finance_with_notion/pages/initial/initial.controller.dart';
import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState
    extends BaseStateWithController<InitialPage, InitialController> {
  @override
  void initState() {
    controller.initiApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
