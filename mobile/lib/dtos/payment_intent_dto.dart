import 'package:json_annotation/json_annotation.dart';

part 'payment_intent_dto.g.dart';

@JsonSerializable()
class PaymentIntentDTO {
  final String clientKey;
  final String clientSecret;

  PaymentIntentDTO({
    required this.clientKey,
    required this.clientSecret,
  });

  factory PaymentIntentDTO.fromJson(Map<String, dynamic> json) => _$PaymentIntentDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentIntentDTOToJson(this);
}
