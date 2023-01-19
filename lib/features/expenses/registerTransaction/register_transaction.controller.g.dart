// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_transaction.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterTransactionController
    on _RegisterTransactionControllerBase, Store {
  late final _$transactionTypeAtom = Atom(
      name: '_RegisterTransactionControllerBase.transactionType',
      context: context);

  @override
  TransactionType get transactionType {
    _$transactionTypeAtom.reportRead();
    return super.transactionType;
  }

  @override
  set transactionType(TransactionType value) {
    _$transactionTypeAtom.reportWrite(value, super.transactionType, () {
      super.transactionType = value;
    });
  }

  late final _$valueAtom =
      Atom(name: '_RegisterTransactionControllerBase.value', context: context);

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$categoryAtom = Atom(
      name: '_RegisterTransactionControllerBase.category', context: context);

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$transactionDateAtom = Atom(
      name: '_RegisterTransactionControllerBase.transactionDate',
      context: context);

  @override
  DateTime get transactionDate {
    _$transactionDateAtom.reportRead();
    return super.transactionDate;
  }

  @override
  set transactionDate(DateTime value) {
    _$transactionDateAtom.reportWrite(value, super.transactionDate, () {
      super.transactionDate = value;
    });
  }

  late final _$_RegisterTransactionControllerBaseActionController =
      ActionController(
          name: '_RegisterTransactionControllerBase', context: context);

  @override
  void setTransactionTypeFromString(String value) {
    final _$actionInfo =
        _$_RegisterTransactionControllerBaseActionController.startAction(
            name:
                '_RegisterTransactionControllerBase.setTransactionTypeFromString');
    try {
      return super.setTransactionTypeFromString(value);
    } finally {
      _$_RegisterTransactionControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setValue(double newValue) {
    final _$actionInfo = _$_RegisterTransactionControllerBaseActionController
        .startAction(name: '_RegisterTransactionControllerBase.setValue');
    try {
      return super.setValue(newValue);
    } finally {
      _$_RegisterTransactionControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(String value) {
    final _$actionInfo = _$_RegisterTransactionControllerBaseActionController
        .startAction(name: '_RegisterTransactionControllerBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_RegisterTransactionControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTransactionDate(DateTime value) {
    final _$actionInfo =
        _$_RegisterTransactionControllerBaseActionController.startAction(
            name: '_RegisterTransactionControllerBase.setTransactionDate');
    try {
      return super.setTransactionDate(value);
    } finally {
      _$_RegisterTransactionControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactionType: ${transactionType},
value: ${value},
category: ${category},
transactionDate: ${transactionDate}
    ''';
  }
}
