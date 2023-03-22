import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:flutter/material.dart';

import 'dataInsights.controller.dart';

class DataInsights extends StatefulWidget {
  const DataInsights({Key? key}) : super(key: key);

  @override
  State<DataInsights> createState() => _DataInsightsState();
}

class _DataInsightsState
    extends BaseStateWithController<DataInsights, DataInsightsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details of expends"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
            child: Text(
          "This page is a future implementation, and will show insights about the expends",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
