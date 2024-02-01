import '../core/entities/order.dart';
import '../dtos/order_dto.dart';
import 'entity_mapper.dart';
import 'order_item_mapper.dart';

class OrderMapper implements EntityMapper<OrderDTO, Order> {
  final OrderItemMapper _itemMapper;

  OrderMapper(this._itemMapper);

  @override
  Order toEntity(OrderDTO it) {
    return Order.lazy(
      id: it.id,
      orderNumber: it.orderNumber,
      items: it.items?.map(_itemMapper.toEntity).toList(),
      status: it.status,
    );
  }
}
