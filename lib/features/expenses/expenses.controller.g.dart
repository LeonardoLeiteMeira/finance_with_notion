// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExpensesController on _ExpensesControllerBase, Store {
  late final _$createNewTransactionAtom = Atom(
      name: '_ExpensesControllerBase.createNewTransaction', context: context);

  @override
  bool get createNewTransaction {
    _$createNewTransactionAtom.reportRead();
    return super.createNewTransaction;
  }

  @override
  set createNewTransaction(bool value) {
    _$createNewTransactionAtom.reportWrite(value, super.createNewTransaction,
        () {
      super.createNewTransaction = value;
    });
  }

  late final _$_ExpensesControllerBaseActionController =
      ActionController(name: '_ExpensesControllerBase', context: context);

  @override
  void setCreateNewTransaction(bool value) {
    final _$actionInfo = _$_ExpensesControllerBaseActionController.startAction(
        name: '_ExpensesControllerBase.setCreateNewTransaction');
    try {
      return super.setCreateNewTransaction(value);
    } finally {
      _$_ExpensesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
createNewTransaction: ${createNewTransaction}
    ''';
  }
}
