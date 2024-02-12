// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckoutViewModel on CheckoutViewModelBase, Store {
  late final _$shippingAddressAtom =
      Atom(name: 'CheckoutViewModelBase.shippingAddress', context: context);

  @override
  Address? get shippingAddress {
    _$shippingAddressAtom.reportRead();
    return super.shippingAddress;
  }

  @override
  set shippingAddress(Address? value) {
    _$shippingAddressAtom.reportWrite(value, super.shippingAddress, () {
      super.shippingAddress = value;
    });
  }

  late final _$checkoutAtom =
      Atom(name: 'CheckoutViewModelBase.checkout', context: context);

  @override
  Checkout? get checkout {
    _$checkoutAtom.reportRead();
    return super.checkout;
  }

  @override
  set checkout(Checkout? value) {
    _$checkoutAtom.reportWrite(value, super.checkout, () {
      super.checkout = value;
    });
  }

  late final _$fetchShippingAddressAsyncAction = AsyncAction(
      'CheckoutViewModelBase.fetchShippingAddress',
      context: context);

  @override
  Future<void> fetchShippingAddress() {
    return _$fetchShippingAddressAsyncAction
        .run(() => super.fetchShippingAddress());
  }

  late final _$createCheckoutAsyncAction =
      AsyncAction('CheckoutViewModelBase.createCheckout', context: context);

  @override
  Future<void> createCheckout(String cartId) {
    return _$createCheckoutAsyncAction.run(() => super.createCheckout(cartId));
  }

  late final _$selectShippingRateAsyncAction =
      AsyncAction('CheckoutViewModelBase.selectShippingRate', context: context);

  @override
  Future<void> selectShippingRate(String shippingRateId) {
    return _$selectShippingRateAsyncAction
        .run(() => super.selectShippingRate(shippingRateId));
  }

  @override
  String toString() {
    return '''
shippingAddress: ${shippingAddress},
checkout: ${checkout}
    ''';
  }
}
