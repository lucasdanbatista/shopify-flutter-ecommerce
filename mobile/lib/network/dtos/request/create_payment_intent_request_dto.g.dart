// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_intent_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePaymentIntentRequestDTO _$CreatePaymentIntentRequestDTOFromJson(
        Map<String, dynamic> json) =>
    CreatePaymentIntentRequestDTO(
      checkoutId: json['checkoutId'] as String,
    );

Map<String, dynamic> _$CreatePaymentIntentRequestDTOToJson(
        CreatePaymentIntentRequestDTO instance) =>
    <String, dynamic>{
      'checkoutId': instance.checkoutId,
    };
