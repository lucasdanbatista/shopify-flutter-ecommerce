import '../core/entities/address.dart';
import '../dtos/address_dto.dart';
import 'entity_mapper.dart';

class AddressMapper implements EntityMapper<AddressDTO, Address> {
  @override
  Address toEntity(AddressDTO it) {
    return Address.lazy(
      recipientFirstName: it.recipientFirstName,
      recipientLastName: it.recipientLastName,
      line1: it.line1,
      line2: it.line2,
      city: it.city,
      province: it.province,
      zipcode: it.zipcode,
    );
  }
}
