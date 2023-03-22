// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataInsights.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataInsightsController on _DataInsightsControllerBase, Store {
  late final _$counterAtom =
      Atom(name: '_DataInsightsControllerBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$_DataInsightsControllerBaseActionController =
      ActionController(name: '_DataInsightsControllerBase', context: context);

  @override
  void setCounter(int value) {
    final _$actionInfo = _$_DataInsightsControllerBaseActionController
        .startAction(name: '_DataInsightsControllerBase.setCounter');
    try {
      return super.setCounter(value);
    } finally {
      _$_DataInsightsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter}
    ''';
  }
}
