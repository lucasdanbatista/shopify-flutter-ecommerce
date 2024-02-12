import '../core/entities/shipping_rate.dart';
import '../dtos/shipping_rate_dto.dart';
import 'entity_mapper.dart';

class ShippingRateMapper
    implements EntityMapper<ShippingRateDTO, ShippingRate> {
  @override
  ShippingRate toEntity(ShippingRateDTO it) {
    return ShippingRate.lazy(
      id: it.id,
      title: it.title,
      price: it.price,
    );
  }
}
