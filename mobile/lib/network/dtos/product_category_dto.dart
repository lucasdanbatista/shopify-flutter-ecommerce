import 'package:json_annotation/json_annotation.dart';

part 'product_category_dto.g.dart';

@JsonSerializable()
class ProductCategoryDTO {
  String? id;
  String? title;

  ProductCategoryDTO({
    this.id,
    this.title,
  });

  factory ProductCategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryDTOToJson(this);
}
