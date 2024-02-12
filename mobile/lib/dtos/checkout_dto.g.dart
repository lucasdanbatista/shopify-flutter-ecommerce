// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutDTO _$CheckoutDTOFromJson(Map<String, dynamic> json) => CheckoutDTO(
      id: json['id'] as String?,
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      selectedShippingRate: json['selectedShippingRate'] == null
          ? null
          : ShippingRateDTO.fromJson(
              json['selectedShippingRate'] as Map<String, dynamic>),
      availableShippingRates: (json['availableShippingRates'] as List<dynamic>?)
          ?.map((e) => ShippingRateDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutDTOToJson(CheckoutDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subtotal': instance.subtotal,
      'total': instance.total,
      'selectedShippingRate': instance.selectedShippingRate,
      'availableShippingRates': instance.availableShippingRates,
    };
