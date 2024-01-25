import 'package:json_annotation/json_annotation.dart';

part 'product_variant_dto.g.dart';

@JsonSerializable()
class ProductVariantDTO {
  double? originalPrice;
  double? sellingPrice;

  ProductVariantDTO({
    this.originalPrice,
    this.sellingPrice,
  });

  factory ProductVariantDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVariantDTOToJson(this);
}
