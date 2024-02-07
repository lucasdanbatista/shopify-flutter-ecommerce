import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDTO {
  String? id;
  String? recipientFirstName;
  String? recipientLastName;
  String? line1;
  String? line2;
  String? city;
  String? province;
  String? zipcode;

  AddressDTO({
    this.id,
    this.recipientFirstName,
    this.recipientLastName,
    this.line1,
    this.line2,
    this.city,
    this.province,
    this.zipcode,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDTOToJson(this);
}
