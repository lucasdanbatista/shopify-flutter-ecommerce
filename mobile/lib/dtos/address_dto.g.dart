// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) => AddressDTO(
      id: json['id'] as String?,
      recipientFirstName: json['recipientFirstName'] as String?,
      recipientLastName: json['recipientLastName'] as String?,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      city: json['city'] as String?,
      province: json['province'] as String?,
      zipcode: json['zipcode'] as String?,
    );

Map<String, dynamic> _$AddressDTOToJson(AddressDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipientFirstName': instance.recipientFirstName,
      'recipientLastName': instance.recipientLastName,
      'line1': instance.line1,
      'line2': instance.line2,
      'city': instance.city,
      'province': instance.province,
      'zipcode': instance.zipcode,
    };
