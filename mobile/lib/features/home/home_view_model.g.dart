// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  Computed<String>? _$pageTitleComputed;

  @override
  String get pageTitle =>
      (_$pageTitleComputed ??= Computed<String>(() => super.pageTitle,
              name: 'HomeViewModelBase.pageTitle'))
          .value;

  late final _$currentPageIndexAtom =
      Atom(name: 'HomeViewModelBase.currentPageIndex', context: context);

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  bool _currentPageIndexIsInitialized = false;

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(
        value, _currentPageIndexIsInitialized ? super.currentPageIndex : null,
        () {
      super.currentPageIndex = value;
      _currentPageIndexIsInitialized = true;
    });
  }

  late final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase', context: context);

  @override
  void setCurrentPageIndex(int value) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.setCurrentPageIndex');
    try {
      return super.setCurrentPageIndex(value);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex},
pageTitle: ${pageTitle}
    ''';
  }
}
