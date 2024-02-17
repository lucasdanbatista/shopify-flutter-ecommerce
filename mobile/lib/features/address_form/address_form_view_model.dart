import '../../core/entities/address.dart';
import '../../core/repositories/address_repository.dart';

class AddressFormViewModel {
  final AddressRepository _repository;

  AddressFormViewModel(this._repository);

  Future<Address> save({
    String? id,
    required String recipientName,
    required String street,
    required String buildingNumber,
    required String neighborhood,
    required String city,
    required String state,
    required String zipcode,
  }) async {
    final address = Address.lazy(
      id: id?.trim(),
      recipientName: recipientName.trim(),
      street: street,
      buildingNumber: buildingNumber,
      neighborhood: neighborhood,
      city: city.trim(),
      state: state.trim(),
      zipcode: zipcode.trim(),
    );
    return id == null
        ? _repository.create(address)
        : _repository.update(address);
  }
}
