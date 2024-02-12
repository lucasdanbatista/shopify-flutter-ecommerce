import '../core/entities/checkout.dart';
import '../dtos/checkout_dto.dart';
import 'entity_mapper.dart';
import 'shipping_rate_mapper.dart';

class CheckoutMapper implements EntityMapper<CheckoutDTO, Checkout> {
  final ShippingRateMapper _shippingRateMapper;

  CheckoutMapper(this._shippingRateMapper);

  @override
  Checkout toEntity(CheckoutDTO it) {
    return Checkout.lazy(
      id: it.id,
      subtotal: it.subtotal,
      total: it.total,
      selectedShippingRate: it.selectedShippingRate != null
          ? _shippingRateMapper.toEntity(it.selectedShippingRate!)
          : null,
      availableShippingRates:
          it.availableShippingRates?.map(_shippingRateMapper.toEntity).toList(),
    );
  }
}
