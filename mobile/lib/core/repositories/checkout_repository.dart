import '../../network/dtos/payment_intent_credentials_dto.dart';
import '../../network/dtos/request/create_payment_intent_request_dto.dart';
import '../../network/web_services/checkout_web_service.dart';

abstract interface class CheckoutRepository {
  Future<String> createCheckout(String cartId);

  Future<PaymentIntentCredentialsDTO> createPaymentIntent(String checkoutId);
}

class DefaultCheckoutRepository implements CheckoutRepository {
  final CheckoutWebService _service;

  DefaultCheckoutRepository(this._service);

  @override
  Future<String> createCheckout(String cartId) async {
    final response = await _service.createCheckout(cartId);
    return response.id;
  }

  @override
  Future<PaymentIntentCredentialsDTO> createPaymentIntent(String checkoutId) =>
      _service.createPaymentIntent(CreatePaymentIntentRequestDTO(checkoutId: checkoutId));
}
