// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent_credentials_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentIntentCredentialsDTO _$PaymentIntentCredentialsDTOFromJson(
        Map<String, dynamic> json) =>
    PaymentIntentCredentialsDTO(
      clientKey: json['clientKey'] as String,
      clientSecret: json['clientSecret'] as String,
    );

Map<String, dynamic> _$PaymentIntentCredentialsDTOToJson(
        PaymentIntentCredentialsDTO instance) =>
    <String, dynamic>{
      'clientKey': instance.clientKey,
      'clientSecret': instance.clientSecret,
    };
