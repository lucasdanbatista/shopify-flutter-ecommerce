import 'package:json_annotation/json_annotation.dart';

import 'shipping_rate_dto.dart';

part 'checkout_dto.g.dart';

@JsonSerializable()
class CheckoutDTO {
  String? id;
  double? subtotal;
  double? total;
  ShippingRateDTO? selectedShippingRate;
  List<ShippingRateDTO>? availableShippingRates;

  CheckoutDTO({
    this.id,
    this.subtotal,
    this.total,
    this.selectedShippingRate,
    this.availableShippingRates,
  });

  factory CheckoutDTO.fromJson(Map<String, dynamic> json) =>
      _$CheckoutDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutDTOToJson(this);
}
