// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_transaction.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterTransactionController
    on _RegisterTransactionControllerBase, Store {
  late final _$isLoadingAtom = Atom(
      name: '_RegisterTransactionControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

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
  void setIsLoading(bool value) {
    final _$actionInfo = _$_RegisterTransactionControllerBaseActionController
        .startAction(name: '_RegisterTransactionControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_RegisterTransactionControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTransactionType(TransactionType value) {
    final _$actionInfo =
        _$_RegisterTransactionControllerBaseActionController.startAction(
            name: '_RegisterTransactionControllerBase.setTransactionType');
    try {
      return super.setTransactionType(value);
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
isLoading: ${isLoading},
transactionType: ${transactionType},
transactionDate: ${transactionDate}
    ''';
  }
}
