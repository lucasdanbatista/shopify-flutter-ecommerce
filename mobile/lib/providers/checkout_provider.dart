import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/checkout_dto.dart';

part 'checkout_provider.g.dart';

@RestApi(baseUrl: '/v1/checkout')
abstract class CheckoutProvider {
  factory CheckoutProvider(Dio dio) = _CheckoutProvider;

  @POST('')
  Future<CheckoutDTO> create({
    @Query('cartId') required String cartId,
    @Query('shippingAddressId') required String shippingAddressId,
  });

  @POST('/{checkoutId}/shipping-line')
  Future<CheckoutDTO> setShippingLine({
    @Path('checkoutId') required String checkoutId,
    @Query('shippingRateId') required String shippingRateId,
  });
}
