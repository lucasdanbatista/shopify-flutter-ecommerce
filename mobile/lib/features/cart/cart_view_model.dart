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
  Future<void> checkout() async {
    await _cartManager.checkout(
      //TODO remove mocked ids
      shippingAddressId: '',
      paymentMethodId: 'pm_1OeJEjJemeNreHwauCw53bgx',
    );
    await _cartManager.initializeNewCart();
    refreshCart();
  }
}
