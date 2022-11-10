// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_transaction.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterTransactionController
    on _RegisterTransactionControllerBase, Store {
  late final _$descriptionAtom = Atom(
      name: '_RegisterTransactionControllerBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
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
  String toString() {
    return '''
description: ${description},
transactionType: ${transactionType}
    ''';
  }
}
