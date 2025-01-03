// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryDetailsViewModel on CategoryDetailsViewModelBase, Store {
  late final _$productsAtom =
      Atom(name: 'CategoryDetailsViewModelBase.products', context: context);

  @override
  List<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('CategoryDetailsViewModelBase.fetch', context: context);

  @override
  Future<void> fetch(String id) {
    return _$fetchAsyncAction.run(() => super.fetch(id));
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
