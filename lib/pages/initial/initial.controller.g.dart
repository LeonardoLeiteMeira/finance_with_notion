// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InitialController on _InitialControllerBase, Store {
  final _$countAtom = Atom(name: '_InitialControllerBase.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$_InitialControllerBaseActionController =
      ActionController(name: '_InitialControllerBase');

  @override
  void setCount() {
    final _$actionInfo = _$_InitialControllerBaseActionController.startAction(
        name: '_InitialControllerBase.setCount');
    try {
      return super.setCount();
    } finally {
      _$_InitialControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count}
    ''';
  }
}
