import 'package:flutter_stripe/flutter_stripe.dart';

import '../../core/repositories/checkout_repository.dart';

class CheckoutViewModel {
  final CheckoutRepository _repository;

  CheckoutViewModel(this._repository);

  Future<void> createPaymentIntent(String cartId) async {
    final checkoutId = await _repository.createCheckout(cartId);
    final credentials = await _repository.createPaymentIntent(checkoutId);
    Stripe.publishableKey = credentials.clientKey;
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Vienna',
        paymentIntentClientSecret: credentials.clientSecret,
      ),
    );
    Stripe.instance.presentPaymentSheet();
  }
}
