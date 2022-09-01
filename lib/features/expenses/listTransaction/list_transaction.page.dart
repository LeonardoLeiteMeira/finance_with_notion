import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:finance_with_notion/shared/widgets/transaction_widget/transaction.widget.dart';

import '../../../shared/models/user_transaction_list_model.dart';
import 'list_transaction.controller.dart';

class ListTransactionPage extends StatefulWidget {
  const ListTransactionPage({Key? key}) : super(key: key);

  @override
  State<ListTransactionPage> createState() => _ListTransactionPageState();
}

class _ListTransactionPageState extends BaseStateWithController<
    ListTransactionPage, ListTransactionController> {
  @override
  void initState() {
    controller.getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var margin = MediaQuery.of(context).size.width * 0.07;
    return Scaffold(
      appBar: myAppBar(context),
      body: Observer(
        builder: (_) => controller.userTransactionsState.handleState(
            initial: showLoading,
            success: (data) => page(data, margin, context),
            error: errorWidget),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: controller.addTransaction,
      ),
    );
  }

  AppBar myAppBar(context) => AppBar(
        backgroundColor: const Color(0xff313EB5),
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
        title: Row(
          children: [
            imageProfile(),
            const SizedBox(width: 20),
            const Text("Hi, Leonardo Leite")
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      );

  Widget imageProfile() => Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage("https://picsum.photos/200/200?random=1"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      );

  Widget page(UserTransactionList? data, double margin, context) => Column(
        children: [
          expendesBarProgress(margin, context),
          buttonSeeDetails(margin, context),
          Divider(
            height: 20,
            color: Colors.black,
            endIndent: margin,
            indent: margin,
          ),
          listOfExpenses(data, context)
        ],
      );

  Widget listOfExpenses(UserTransactionList? data, context) => ListView.builder(
        shrinkWrap: true,
        itemCount: data?.userTransactions.length ?? 0,
        itemBuilder: (context, index) {
          return TransactionWidget(
            userTransaction: data?.userTransactions.elementAt(index),
          );
        },
      );

  Widget expendesBarProgress(double margin, context) {
    double barWidth = MediaQuery.of(context).size.width * 0.5;
    double barThickness = 30;
    double height = 70;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: height / 4),
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              valueText("\$10", margin),
              Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  simpleBarProgress(barThickness, barWidth, Colors.green),
                  simpleBarProgress(
                      barThickness, barWidth * 0.6, Colors.yellow),
                  simpleBarProgress(barThickness, barWidth * 0.3, Colors.red),
                ],
              ),
              valueText("\$1000", margin),
            ],
          ),
          const Text("Details")
        ],
      ),
    );
  }

  Widget simpleBarProgress(double thickness, double width, Color color) =>
      Container(
        height: thickness,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
      );

  Widget valueText(String value, double margin) => Container(
        margin: EdgeInsets.only(left: margin, right: margin),
        alignment: Alignment.centerLeft,
        child: Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );

  Widget buttonSeeDetails(double margin, context) => Container(
        width: MediaQuery.of(context).size.width * 0.86,
        height: 55,
        margin: EdgeInsets.only(left: margin, right: margin),
        child: ElevatedButton(
          child: const Text(
            "See details of expends",
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(),
          onPressed: () {},
        ),
      );
}
