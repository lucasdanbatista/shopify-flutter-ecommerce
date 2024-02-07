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
    required String province,
    required String zipcode,
  }) async {
    final address = Address.lazy(
      id: id?.trim(),
      recipientFirstName: recipientName.trim().split(' ').first,
      recipientLastName: recipientName.trim().split(' ').last,
      line1: '${street.trim()}, ${buildingNumber.trim()}',
      line2: neighborhood.trim(),
      city: city.trim(),
      province: province.trim(),
      zipcode: zipcode.trim(),
    );
    return id == null
        ? _repository.create(address)
        : _repository.update(address);
  }
}
