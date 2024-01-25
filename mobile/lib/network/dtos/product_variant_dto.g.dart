// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariantDTO _$ProductVariantDTOFromJson(Map<String, dynamic> json) =>
    ProductVariantDTO(
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      sellingPrice: (json['sellingPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductVariantDTOToJson(ProductVariantDTO instance) =>
    <String, dynamic>{
      'originalPrice': instance.originalPrice,
      'sellingPrice': instance.sellingPrice,
    };
