// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentIntentDTO _$PaymentIntentDTOFromJson(Map<String, dynamic> json) =>
    PaymentIntentDTO(
      clientKey: json['clientKey'] as String,
      clientSecret: json['clientSecret'] as String,
    );

Map<String, dynamic> _$PaymentIntentDTOToJson(PaymentIntentDTO instance) =>
    <String, dynamic>{
      'clientKey': instance.clientKey,
      'clientSecret': instance.clientSecret,
    };
