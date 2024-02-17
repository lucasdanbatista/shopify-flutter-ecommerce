import '../core/entities/address.dart';
import '../dtos/address_dto.dart';
import 'entity_mapper.dart';

class AddressMapper implements EntityMapper<AddressDTO, Address> {
  @override
  Address toEntity(AddressDTO it) {
    return Address.lazy(
      id: it.id,
      recipientName: it.recipientName,
      street: it.street,
      buildingNumber: it.buildingNumber,
      neighborhood: it.neighborhood,
      city: it.city,
      state: it.state,
      zipcode: it.zipcode,
    );
  }
}
