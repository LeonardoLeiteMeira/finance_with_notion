import 'package:flutter/material.dart';
import 'package:finance_with_notion/shared/base/base.page.dart';
import 'package:finance_with_notion/shared/widgets/transaction_widget/transaction.widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/models/user_transaction_list_model.dart';
import 'list_transaction.controller.dart';

class ListTransactionPage extends StatefulWidget {
  const ListTransactionPage({Key? key}) : super(key: key);

  @override
  State<ListTransactionPage> createState() => _ListTransactionPageState();
}

class _ListTransactionPageState extends BaseStateWithController<
    ListTransactionPage, ListTransactionController> {
  final double imageProfileDiameter = 70;

  @override
  void initState() {
    controller.getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sideMargin = MediaQuery.of(context).size.width * 0.04;
    return Scaffold(
      appBar: myAppBar(context),
      body: Observer(
        builder: (_) => controller.userTransactionsState.handleState(
            initial: showLoading,
            success: (data) => page(data, sideMargin, context),
            error: errorWidget),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: controller.navigateToCreateTransactionPage,
      ),
    );
  }

  AppBar myAppBar(context) => AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff313EB5),
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
        title: Row(
          children: [
            imageProfile(),
            const SizedBox(width: 20),
            const Flexible(
                child: Text(
              "Hi, Leonardo Leite",
              overflow: TextOverflow.fade,
            ))
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      );

  Widget imageProfile() => Container(
        width: imageProfileDiameter,
        height: imageProfileDiameter,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(imageProfileDiameter),
            color: Colors.black),
        child: const Icon(
          Icons.person,
          size: 35,
        ),
      );

  Widget page(UserTransactionList? data, double sideMargin, context) => Column(
        children: [
          expendesBarProgress(sideMargin, context),
          buttonSeeDetails(sideMargin, context),
          Divider(
            height: 20,
            color: Colors.black,
            endIndent: sideMargin,
            indent: sideMargin,
          ),
          listOfExpenses(data, sideMargin, context)
        ],
      );

  Widget listOfExpenses(
          UserTransactionList? data, double sideMargin, context) =>
      Expanded(
        child: ListView.builder(
          itemCount: data?.userTransactions.length ?? 0,
          itemBuilder: (context, index) {
            return TransactionWidget(
              userTransaction: data?.userTransactions.elementAt(index),
              sideMargin: sideMargin,
            );
          },
        ),
      );

  Widget expendesBarProgress(double margin, context) {
    double barWidth = MediaQuery.of(context).size.width * 0.55;
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
              Container(
                margin: EdgeInsets.only(left: margin),
                child: valueText("\$10"),
              ),
              Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  simpleBarProgress(barThickness, barWidth, Colors.green),
                  simpleBarProgress(
                      barThickness, barWidth * 0.6, Colors.yellow),
                  simpleBarProgress(barThickness, barWidth * 0.3, Colors.red),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: margin),
                child: valueText("\$100000"),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: margin, left: margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total expend"),
                Text("10%"),
                Text("80%"),
                Text("Total incomes"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget valueText(String value) => Text(
        value,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      );

  Widget simpleBarProgress(double thickness, double width, Color color) =>
      Container(
        height: thickness,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
      );

  Widget buttonSeeDetails(double margin, context) => Container(
        width: MediaQuery.of(context).size.width - (2 * margin),
        height: 55,
        margin: EdgeInsets.only(left: margin, right: margin),
        child: ElevatedButton(
          child: const Text(
            "See details of expends",
            style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(),
          onPressed: () => controller.navigateToSeeDatailsPage(),
        ),
      );
}
