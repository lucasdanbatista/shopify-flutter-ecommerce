import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../utils/formatters/address_formatter.dart';
import '../../utils/formatters/currency_formatter.dart';
import '../../utils/init_state_mixin.dart';
import '../../widgets/list_tiles/order_item_list_tile.dart';
import '../../widgets/order_summary.dart';
import '../../widgets/progress_indicators/text_progress_indicator.dart';
import '../cart/cart_view_model.dart';
import 'checkout_view_model.dart';

@RoutePage()
class CheckoutPage extends StatelessWidget with InitStateMixin {
  final cartViewModel = GetIt.I<CartViewModel>();
  final checkoutViewModel = GetIt.I<CheckoutViewModel>();

  CheckoutPage({super.key});

  @override
  void initState() async {
    await checkoutViewModel.fetchShippingAddress();
    await checkoutViewModel.createCheckout(cartViewModel.cart.id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo do pedido'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Forma de pagamento',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                //TODO: remove mocked payment method
                ListTile(
                  leading: const Icon(Icons.payment),
                  title: const Text('VISA **** **** **** 2056'),
                  subtitle: const Text('Vence em 12/2026'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Observer(
              builder: (context) {
                final shippingAddress = checkoutViewModel.shippingAddress;
                if (shippingAddress == null) return const SizedBox.shrink();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Endereço de entrega',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text(shippingAddress.recipientName),
                      subtitle: Text(
                        AddressFormatter().format(shippingAddress),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () => throw UnimplementedError(),
                      ),
                    ),
                  ],
                );
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Frete',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Observer(
                  builder: (context) {
                    final checkout = checkoutViewModel.checkout;
                    if (checkout == null) {
                      return const Padding(
                        padding: EdgeInsets.fromLTRB(20, 8, 16, 8),
                        child: TextProgressIndicator(
                          'Obtendo fretes disponíveis...',
                        ),
                      );
                    }
                    return Column(
                      children: checkout.availableShippingRates
                          .map(
                            (rate) => RadioListTile(
                              title: Text(rate.title),
                              secondary: Text(
                                CurrencyFormatter().format(rate.price),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              value: rate.id,
                              groupValue: checkout.selectedShippingRate?.id,
                              onChanged: (value) {
                                if (value != null) {
                                  checkoutViewModel.selectShippingRate(value);
                                }
                              },
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Items do pedido (${cartViewModel.cart.lines.length})',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                ...cartViewModel.cart.lines.map(
                  (line) => OrderItemListTile(
                    productTitle: line.productVariant.title,
                    productImage: line.productVariant.image,
                    quantity: line.quantity,
                    total: line.total,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.topStart,
      persistentFooterButtons: [
        Observer(
          builder: (context) => OrderSummary(
            confirmationButtonText: 'CONFIRMAR PEDIDO',
            onConfirmationButtonPressed: checkoutViewModel.checkout == null
                ? null
                : () => throw UnimplementedError(),
            showConfirmationButton: true,
            lines: [
              _orderSummaryLine(
                context: context,
                title: 'Frete',
                loading:
                    checkoutViewModel.checkout?.selectedShippingRate == null,
                value: checkoutViewModel.checkout?.selectedShippingRate?.price,
              ),
              _orderSummaryLine(
                context: context,
                title: 'Subtotal',
                loading: checkoutViewModel.checkout == null,
                value: checkoutViewModel.checkout?.subtotal,
              ),
              _orderSummaryLine(
                context: context,
                title: 'Total',
                loading: checkoutViewModel.checkout == null,
                value: checkoutViewModel.checkout?.total,
              ),
            ],
          ),
        ),
      ],
    );
  }

  OrderSummaryLine _orderSummaryLine({
    required BuildContext context,
    required String title,
    required bool loading,
    double? value,
  }) {
    return OrderSummaryLine(
      title: title,
      value: loading
          ? TextProgressIndicator(
              'calculando...',
              textStyle: Theme.of(context).textTheme.bodyMedium,
            )
          : Text(
              CurrencyFormatter().format(value!),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
    );
  }
}
