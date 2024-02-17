import 'entity.dart';

class Address implements Entity {
  late final String id;
  late final String recipientName;
  late final String street;
  late final String buildingNumber;
  late final String neighborhood;
  late final String city;
  late final String state;
  late final String zipcode;

  Address.lazy({
    String? id,
    String? recipientName,
    String? street,
    String? buildingNumber,
    String? neighborhood,
    String? city,
    String? state,
    String? zipcode,
  }) {
    if (id != null) this.id = id;
    if (recipientName != null) this.recipientName = recipientName;
    if (street != null) this.street = street;
    if (buildingNumber != null) this.buildingNumber = buildingNumber;
    if (neighborhood != null) this.neighborhood = neighborhood;
    if (city != null) this.city = city;
    if (state != null) this.state = state;
    if (zipcode != null) this.zipcode = zipcode;
  }
}
