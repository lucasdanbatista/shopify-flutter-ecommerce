import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/cart_dto.dart';
import '../dtos/cart_line_dto.dart';

part 'cart_web_service.g.dart';

@RestApi(baseUrl: '/v1/carts')
abstract class CartWebService {
  factory CartWebService(Dio dio) = _CartWebService;

  @GET('/{id}')
  Future<CartDTO> getCartById(@Path('id') String id);

  @POST('')
  Future<CartDTO> createCart();

  @POST('/{id}/lines')
  Future<CartDTO> addCartLine({
    @Path('id') required String cartId,
    @Query('productVariantId') required String productVariantId,
  });

  @PATCH('/{id}/lines')
  Future<CartDTO> updateCartLine({
    @Path('id') required String cartId,
    @Body() required CartLineDTO cartLine,
  });

  @POST('/{id}/checkout')
  Future<void> checkout({
    @Path('id') required String cartId,
    @Query('shippingAddressId') required String shippingAddressId,
    @Query('paymentMethodId') required String paymentMethodId,
  });
}
