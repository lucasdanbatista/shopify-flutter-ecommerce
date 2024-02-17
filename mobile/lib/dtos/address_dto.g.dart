// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) => AddressDTO(
      id: json['id'] as String?,
      recipientName: json['recipientName'] as String?,
      street: json['street'] as String?,
      buildingNumber: json['buildingNumber'] as String?,
      neighborhood: json['neighborhood'] as String?,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zipcode: json['zipcode'] as String?,
    );

Map<String, dynamic> _$AddressDTOToJson(AddressDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipientName': instance.recipientName,
      'street': instance.street,
      'buildingNumber': instance.buildingNumber,
      'neighborhood': instance.neighborhood,
      'line1': instance.line1,
      'line2': instance.line2,
      'city': instance.city,
      'state': instance.state,
      'zipcode': instance.zipcode,
    };
