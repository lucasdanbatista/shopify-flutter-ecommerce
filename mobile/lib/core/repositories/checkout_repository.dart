import '../../mappers/checkout_mapper.dart';
import '../../providers/checkout_provider.dart';
import '../entities/checkout.dart';

abstract interface class CheckoutRepository {
  Future<Checkout> create({
    required String cartId,
    required String shippingAddressId,
  });

  Future<Checkout> setShippingLine({
    required String checkoutId,
    required String shippingRateId,
  });
}

class DefaultCheckoutRepository implements CheckoutRepository {
  final CheckoutProvider _provider;
  final CheckoutMapper _mapper;

  DefaultCheckoutRepository(this._provider, this._mapper);

  @override
  Future<Checkout> create({
    required String cartId,
    required String shippingAddressId,
  }) async {
    final response = await _provider.create(
      cartId: cartId,
      shippingAddressId: shippingAddressId,
    );
    return _mapper.toEntity(response);
  }

  @override
  Future<Checkout> setShippingLine({
    required String checkoutId,
    required String shippingRateId,
  }) async {
    final response = await _provider.setShippingLine(
      checkoutId: checkoutId,
      shippingRateId: shippingRateId,
    );
    return _mapper.toEntity(response);
  }
}
