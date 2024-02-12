// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_rate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingRateDTO _$ShippingRateDTOFromJson(Map<String, dynamic> json) =>
    ShippingRateDTO(
      id: json['id'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShippingRateDTOToJson(ShippingRateDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
    };
