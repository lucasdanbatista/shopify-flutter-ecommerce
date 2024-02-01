// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemDTO _$OrderItemDTOFromJson(Map<String, dynamic> json) => OrderItemDTO(
      title: json['title'] as String?,
      productVariant: json['productVariant'] == null
          ? null
          : ProductVariantDTO.fromJson(
              json['productVariant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderItemDTOToJson(OrderItemDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'productVariant': instance.productVariant,
    };
