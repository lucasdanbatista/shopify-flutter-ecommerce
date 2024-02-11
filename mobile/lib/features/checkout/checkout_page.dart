import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/formatters/address_formatter.dart';
import '../../util/formatters/currency_formatter.dart';
import '../../util/init_state_mixin.dart';
import '../cart/cart_view_model.dart';
import '../cart/widgets/order_summary.dart';
import '../orders/widgets/order_item_list_tile.dart';
import 'checkout_view_model.dart';

@RoutePage()
class CheckoutPage extends StatelessWidget with InitStateMixin {
  final cartViewModel = GetIt.I<CartViewModel>();
  final checkoutViewModel = GetIt.I<CheckoutViewModel>();

  CheckoutPage({super.key});

  @override
  void initState() {
    checkoutViewModel.fetchShippingAddress();
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
          children: [
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
                        onPressed: () {},
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
        OrderSummary(
          confirmationButtonText: 'PAGAR',
          onConfirmationButtonPressed: cartViewModel.createPaymentIntent,
          additionalLines: [
            OrderSummaryLine(
              title: 'Frete',
              //TODO: remove mocked shipping coast
              value: CurrencyFormatter().format(14.97),
            ),
          ],
        ),
      ],
    );
  }
}
