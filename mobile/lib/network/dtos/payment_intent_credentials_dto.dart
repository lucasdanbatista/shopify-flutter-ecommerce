import 'package:json_annotation/json_annotation.dart';

part 'payment_intent_credentials_dto.g.dart';

@JsonSerializable()
class PaymentIntentCredentialsDTO {
  final String clientKey;
  final String clientSecret;

  PaymentIntentCredentialsDTO({
    required this.clientKey,
    required this.clientSecret,
  });

  factory PaymentIntentCredentialsDTO.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentCredentialsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentIntentCredentialsDTOToJson(this);
}
