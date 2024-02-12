import 'package:mobx/mobx.dart';

import '../../core/entities/address.dart';
import '../../core/entities/checkout.dart';
import '../../core/repositories/address_repository.dart';
import '../../core/repositories/checkout_repository.dart';

part 'checkout_view_model.g.dart';

class CheckoutViewModel = CheckoutViewModelBase with _$CheckoutViewModel;

abstract class CheckoutViewModelBase with Store {
  final AddressRepository _addressRepository;
  final CheckoutRepository _checkoutRepository;

  CheckoutViewModelBase(this._addressRepository, this._checkoutRepository);

  @observable
  Address? shippingAddress;

  @observable
  Checkout? checkout;

  @action
  Future<void> fetchShippingAddress() async {
    final addresses = await _addressRepository.findAll();
    shippingAddress = addresses.firstOrNull;
  }

  @action
  Future<void> createCheckout(String cartId) async {
    checkout = await _checkoutRepository.create(
      cartId: cartId,
      shippingAddressId: shippingAddress!.id,
    );
    if (checkout!.availableShippingRates.isNotEmpty) {
      selectShippingRate(checkout!.availableShippingRates.first.id);
    }
  }

  @action
  Future<void> selectShippingRate(String shippingRateId) async {
    checkout = await _checkoutRepository.setShippingLine(
      checkoutId: checkout!.id,
      shippingRateId: shippingRateId,
    );
  }
}
