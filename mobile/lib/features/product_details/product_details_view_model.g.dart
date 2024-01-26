// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductDetailsViewModel on ProductDetailsViewModelBase, Store {
  late final _$productAtom =
      Atom(name: 'ProductDetailsViewModelBase.product', context: context);

  @override
  Product? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$addedToCartAtom =
      Atom(name: 'ProductDetailsViewModelBase.addedToCart', context: context);

  @override
  bool get addedToCart {
    _$addedToCartAtom.reportRead();
    return super.addedToCart;
  }

  @override
  set addedToCart(bool value) {
    _$addedToCartAtom.reportWrite(value, super.addedToCart, () {
      super.addedToCart = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('ProductDetailsViewModelBase.fetch', context: context);

  @override
  Future<void> fetch(String id) {
    return _$fetchAsyncAction.run(() => super.fetch(id));
  }

  late final _$ProductDetailsViewModelBaseActionController =
      ActionController(name: 'ProductDetailsViewModelBase', context: context);

  @override
  void setAddedToCart(bool value) {
    final _$actionInfo = _$ProductDetailsViewModelBaseActionController
        .startAction(name: 'ProductDetailsViewModelBase.setAddedToCart');
    try {
      return super.setAddedToCart(value);
    } finally {
      _$ProductDetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product},
addedToCart: ${addedToCart}
    ''';
  }
}
