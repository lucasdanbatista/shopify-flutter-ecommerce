// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) => OrderDTO(
      id: json['id'] as String?,
      orderNumber: json['orderNumber'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : AddressDTO.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderDTOToJson(OrderDTO instance) => <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'items': instance.items,
      'status': _$OrderStatusEnumMap[instance.status],
      'shippingAddress': instance.shippingAddress,
      'total': instance.total,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.paymentRejected: 'PAYMENT_REJECTED',
  OrderStatus.waitingPayment: 'WAITING_PAYMENT',
  OrderStatus.paid: 'PAID',
  OrderStatus.onTheWay: 'ON_THE_WAY',
  OrderStatus.canceled: 'CANCELED',
  OrderStatus.delivered: 'DELIVERED',
  OrderStatus.unknownStatus: 'UNKNOWN_STATUS',
};
