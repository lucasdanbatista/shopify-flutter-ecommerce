import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDTO {
  String? id;
  String? recipientName;
  String? street;
  String? buildingNumber;
  String? neighborhood;
  String? line1;
  String? line2;
  String? city;
  String? state;
  String? zipcode;

  AddressDTO({
    this.id,
    this.recipientName,
    this.street,
    this.buildingNumber,
    this.neighborhood,
    this.line1,
    this.line2,
    this.city,
    this.state,
    this.zipcode,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDTOToJson(this);
}
