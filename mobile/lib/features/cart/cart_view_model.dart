import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mobx/mobx.dart';

import '../../core/cart_manager.dart';
import '../../core/entities/cart.dart';

part 'cart_view_model.g.dart';

class CartViewModel = CartViewModelBase with _$CartViewModel;

abstract class CartViewModelBase with Store {
  final CartManager _cartManager;

  CartViewModelBase(this._cartManager);

  @observable
  late Cart cart = _cartManager.currentCart;

  @action
  void refreshCart() => cart = _cartManager.currentCart;

  @action
  Future<void> addCartLine(String productVariantId) async {
    await _cartManager.addCartLine(productVariantId);
    refreshCart();
  }

  @action
  Future<void> updateCartLine(String cartLineId, int quantity) async {
    await _cartManager.updateCartLine(cartLineId, quantity);
    refreshCart();
  }

  @action
  Future<void> createPaymentIntent() async {
    final paymentIntent = await _cartManager.createPaymentIntent();
    Stripe.publishableKey = paymentIntent.clientKey;
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent.clientSecret,
      ),
    );
    await Stripe.instance.presentPaymentSheet();
    await _cartManager.initializeNewCart();
    refreshCart();
  }
}
