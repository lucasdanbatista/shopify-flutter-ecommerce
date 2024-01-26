// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartViewModel on CartViewModelBase, Store {
  late final _$cartAtom =
      Atom(name: 'CartViewModelBase.cart', context: context);

  @override
  Cart? get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(Cart? value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('CartViewModelBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$addCartLineAsyncAction =
      AsyncAction('CartViewModelBase.addCartLine', context: context);

  @override
  Future<void> addCartLine(String productVariantId) {
    return _$addCartLineAsyncAction
        .run(() => super.addCartLine(productVariantId));
  }

  late final _$updateCartLineAsyncAction =
      AsyncAction('CartViewModelBase.updateCartLine', context: context);

  @override
  Future<void> updateCartLine(
      {required String cartLineId, required int quantity}) {
    return _$updateCartLineAsyncAction.run(
        () => super.updateCartLine(cartLineId: cartLineId, quantity: quantity));
  }

  @override
  String toString() {
    return '''
cart: ${cart}
    ''';
  }
}
