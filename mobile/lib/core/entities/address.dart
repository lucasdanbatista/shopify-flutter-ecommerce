import 'entity.dart';

class Address implements Entity {
  late final String recipientFirstName;
  late final String recipientLastName;
  late final String line1;
  late final String line2;
  late final String city;
  late final String province;
  late final String zipcode;

  Address.lazy({
    String? recipientFirstName,
    String? recipientLastName,
    String? line1,
    String? line2,
    String? city,
    String? province,
    String? zipcode,
  }) {
    if (recipientFirstName != null) this.recipientFirstName = recipientFirstName;
    if (recipientLastName != null) this.recipientLastName = recipientLastName;
    if (line1 != null) this.line1 = line1;
    if (line2 != null) this.line2 = line2;
    if (city != null) this.city = city;
    if (province != null) this.province = province;
    if (zipcode != null) this.zipcode = zipcode;
  }

  String get recipientName => '$recipientFirstName $recipientLastName';
}
