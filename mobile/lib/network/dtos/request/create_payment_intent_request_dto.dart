import 'package:json_annotation/json_annotation.dart';

part 'create_payment_intent_request_dto.g.dart';

@JsonSerializable()
class CreatePaymentIntentRequestDTO {
  final String checkoutId;

  CreatePaymentIntentRequestDTO({
    required this.checkoutId,
  });

  factory CreatePaymentIntentRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentIntentRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePaymentIntentRequestDTOToJson(this);
}
