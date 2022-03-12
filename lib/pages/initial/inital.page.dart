import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:leo_financial/pages/initial/initial.controller.dart';
import 'package:leo_financial/shared/base/base.page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState
    extends BaseStateWithController<InitialPage, InitialController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //configurar rotas
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Counter"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Observer(builder: (_) => Text('${controller.count}')),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => controller.setCount,
        ),
      ),
    );
  }
}
