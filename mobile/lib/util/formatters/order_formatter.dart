import 'package:flutter/material.dart';

import '../../core/entities/order.dart';
import '../../core/entities/order_status.dart';

class OrderFormatter {
  final Order _order;

  OrderFormatter(this._order);

  String get title {
    var title = '';
    for (final item in _order.items) {
      title += item.title;
      if (item != _order.items.last) {
        title += ' + ';
      }
    }
    return title;
  }

  String get shippingAddress => '${_order.shippingAddress.line1}, ${_order.shippingAddress.line2}. '
      '${_order.shippingAddress.city}, ${_order.shippingAddress.province}, '
      'CEP: ${_order.shippingAddress.zipcode}.';

  String get statusText => switch (_order.status) {
        OrderStatus.paymentRejected => 'Pagamento rejeitado',
        OrderStatus.waitingPayment => 'Aguardando pagamento',
        OrderStatus.paid => 'Pagamento aprovado',
        OrderStatus.onTheWay => 'Pedido à caminho',
        OrderStatus.canceled => 'Pedido cancelado',
        OrderStatus.delivered => 'Pedido entregue',
        OrderStatus.unknownStatus => 'Status desconhecido',
      };

  Color? get statusColor => switch (_order.status) {
        OrderStatus.paymentRejected => Colors.red.shade700,
        OrderStatus.waitingPayment => Colors.orange.shade700,
        OrderStatus.paid => Colors.green.shade700,
        OrderStatus.onTheWay => Colors.orange.shade700,
        OrderStatus.canceled => Colors.red.shade700,
        OrderStatus.delivered => Colors.green.shade700,
        OrderStatus.unknownStatus => null,
      };
}
