import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/checkout_dto.dart';
import '../dtos/payment_intent_credentials_dto.dart';
import '../dtos/request/create_payment_intent_request_dto.dart';

part 'checkout_web_service.g.dart';

@RestApi(baseUrl: '/v1/checkouts')
abstract class CheckoutWebService {
  factory CheckoutWebService(Dio dio) = _CheckoutWebService;

  @POST('')
  Future<CheckoutDTO> createCheckout(@Query('cartId') String cartId);

  @POST('/payment-intents')
  Future<PaymentIntentCredentialsDTO> createPaymentIntent(
    @Body() CreatePaymentIntentRequestDTO body,
  );
}
