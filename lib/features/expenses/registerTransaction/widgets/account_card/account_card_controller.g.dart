// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountCardController on _AccountCardControllerBase, Store {
  late final _$accountOrOriginsAtom = Atom(
      name: '_AccountCardControllerBase.accountOrOrigins', context: context);

  @override
  ObservableList<String> get accountOrOrigins {
    _$accountOrOriginsAtom.reportRead();
    return super.accountOrOrigins;
  }

  @override
  set accountOrOrigins(ObservableList<String> value) {
    _$accountOrOriginsAtom.reportWrite(value, super.accountOrOrigins, () {
      super.accountOrOrigins = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AccountCardControllerBase.isLoading', context: context);

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

  late final _$_AccountCardControllerBaseActionController =
      ActionController(name: '_AccountCardControllerBase', context: context);

  @override
  void setAccountOrOrigins(List<String> values) {
    final _$actionInfo = _$_AccountCardControllerBaseActionController
        .startAction(name: '_AccountCardControllerBase.setAccountOrOrigins');
    try {
      return super.setAccountOrOrigins(values);
    } finally {
      _$_AccountCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_AccountCardControllerBaseActionController
        .startAction(name: '_AccountCardControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_AccountCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accountOrOrigins: ${accountOrOrigins},
isLoading: ${isLoading}
    ''';
  }
}
