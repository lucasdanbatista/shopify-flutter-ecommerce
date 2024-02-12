import 'package:json_annotation/json_annotation.dart';

part 'shipping_rate_dto.g.dart';

@JsonSerializable()
class ShippingRateDTO {
  String? id;
  String? title;
  double? price;

  ShippingRateDTO({
    this.id,
    this.title,
    this.price,
  });

  factory ShippingRateDTO.fromJson(Map<String, dynamic> json) =>
      _$ShippingRateDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingRateDTOToJson(this);
}
