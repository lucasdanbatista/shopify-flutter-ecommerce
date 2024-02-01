import 'package:json_annotation/json_annotation.dart';

enum OrderStatus {
  @JsonValue('PAYMENT_REJECTED')
  paymentRejected,
  @JsonValue('WAITING_PAYMENT')
  waitingPayment,
  @JsonValue('PAID')
  paid,
  @JsonValue('ON_THE_WAY')
  onTheWay,
  @JsonValue('CANCELED')
  canceled,
  @JsonValue('DELIVERED')
  delivered,
  @JsonValue('UNKNOWN_STATUS')
  unknownStatus,
}
