import '../../core/entities/address.dart';
import '../../core/repositories/address_repository.dart';

class AddressFormViewModel {
  final AddressRepository _repository;

  AddressFormViewModel(this._repository);

  Future<Address> save({
    required String recipientFirstName,
    required String recipientLastName,
    required String line1,
    required String line2,
    required String city,
    required String province,
    required String zipcode,
  }) async =>
      _repository.create(
        recipientFirstName: recipientFirstName,
        recipientLastName: recipientLastName,
        line1: line1,
        line2: line2,
        city: city,
        province: province,
        zipcode: zipcode,
      );
}
