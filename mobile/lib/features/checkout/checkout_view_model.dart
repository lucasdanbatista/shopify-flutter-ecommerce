import 'package:mobx/mobx.dart';

import '../../core/entities/address.dart';
import '../../core/repositories/address_repository.dart';

part 'checkout_view_model.g.dart';

class CheckoutViewModel = CheckoutViewModelBase with _$CheckoutViewModel;

abstract class CheckoutViewModelBase with Store {
  final AddressRepository _addressRepository;

  CheckoutViewModelBase(this._addressRepository);

  @observable
  Address? shippingAddress;

  @action
  Future<void> fetchShippingAddress() async {
    final addresses = await _addressRepository.findAll();
    shippingAddress = addresses.firstOrNull;
  }
}
