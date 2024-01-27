import 'package:json_annotation/json_annotation.dart';

part 'checkout_dto.g.dart';

@JsonSerializable()
class CheckoutDTO {
  final String id;

  CheckoutDTO(this.id);

  factory CheckoutDTO.fromJson(Map<String, dynamic> json) => _$CheckoutDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutDTOToJson(this);
}
