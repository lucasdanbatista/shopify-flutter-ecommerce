import 'package:flutter/material.dart';

import 'entity.dart';
import 'order_item.dart';
import 'order_status.dart';

class Order implements Entity {
  late final String id;
  late final int orderNumber;
  late final List<OrderItem> items;
  late final OrderStatus status;

  Order.lazy({
    String? id,
    int? orderNumber,
    List<OrderItem>? items,
    OrderStatus? status,
  }) {
    if (id != null) this.id = id;
    if (orderNumber != null) this.orderNumber = orderNumber;
    if (items != null) this.items = items;
    if (status != null) this.status = status;
  }

  String get title {
    var title = '';
    for (final item in items) {
      title += item.title;
      if (item != items.last) {
        title += ' + ';
      }
    }
    return title;
  }

  String get statusText => switch (status) {
        OrderStatus.paymentRejected => 'Pagamento rejeitado',
        OrderStatus.waitingPayment => 'Aguardando pagamento',
        OrderStatus.paid => 'Pagamento aprovado',
        OrderStatus.onTheWay => 'Pedido à caminho',
        OrderStatus.canceled => 'Pedido cancelado',
        OrderStatus.delivered => 'Pedido entregue',
        OrderStatus.unknownStatus => 'Status desconhecido',
      };

  Color? get statusTextColor => switch (status) {
        OrderStatus.paymentRejected => Colors.red.shade700,
        OrderStatus.waitingPayment => Colors.orange.shade700,
        OrderStatus.paid => Colors.green.shade700,
        OrderStatus.onTheWay => Colors.orange.shade700,
        OrderStatus.canceled => Colors.red.shade700,
        OrderStatus.delivered => Colors.green.shade700,
        OrderStatus.unknownStatus => null,
      };
}
