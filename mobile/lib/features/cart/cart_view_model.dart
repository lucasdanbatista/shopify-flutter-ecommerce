import 'package:mobx/mobx.dart';

import '../../core/entities/cart.dart';
import '../../core/repositories/cart_repository.dart';

part 'cart_view_model.g.dart';

class CartViewModel = CartViewModelBase with _$CartViewModel;

abstract class CartViewModelBase with Store {
  final CartRepository _repository;

  //TODO: remove hardcoded ids
  static const _hardCodedCartId = 'Z2NwLXVzLWVhc3QxOjAxSE4yWkoyMzZFVkQ2MjlUUzVUNEEzNEVK';
  static const _hardcodedPaymentMethodId = 'pm_1OdZzDJemeNreHwaBMAkAaGo';
  static const _hardcodedShippingAddressId = '';

  CartViewModelBase(this._repository);

  @observable
  Cart? cart;

  @action
  Future<void> fetch() async => cart = await _repository.getCartById(_hardCodedCartId);

  @action
  Future<void> addCartLine(String productVariantId) async => cart = await _repository.addCartLine(
        cartId: _hardCodedCartId,
        productVariantId: productVariantId,
      );

  @action
  Future<void> updateCartLine({
    required String cartLineId,
    required int quantity,
  }) async =>
      cart = await _repository.updateCartLine(
        cartId: cart!.id,
        cartLineId: cartLineId,
        quantity: quantity,
      );

  Future<void> processPayment() => _repository.checkout(
        cartId: cart!.id,
        shippingAddressId: _hardcodedShippingAddressId,
        paymentMethodId: _hardcodedPaymentMethodId,
      );
}
