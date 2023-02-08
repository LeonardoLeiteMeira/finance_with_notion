// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectCategoryController on _SelectCategoryControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SelectCategoryControllerBase.isLoading', context: context);

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

  late final _$categoriesAtom =
      Atom(name: '_SelectCategoryControllerBase.categories', context: context);

  @override
  ObservableList<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$_SelectCategoryControllerBaseActionController =
      ActionController(name: '_SelectCategoryControllerBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_SelectCategoryControllerBaseActionController
        .startAction(name: '_SelectCategoryControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_SelectCategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategories(List<String> values) {
    final _$actionInfo = _$_SelectCategoryControllerBaseActionController
        .startAction(name: '_SelectCategoryControllerBase.setCategories');
    try {
      return super.setCategories(values);
    } finally {
      _$_SelectCategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
categories: ${categories}
    ''';
  }
}
