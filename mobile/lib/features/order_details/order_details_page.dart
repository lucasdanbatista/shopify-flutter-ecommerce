import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/formatters/currency_formatter.dart';
import '../../util/formatters/order_formatter.dart';
import '../../util/init_state_mixin.dart';
import 'order_details_view_model.dart';

@RoutePage()
class OrderDetailsPage extends StatelessWidget with InitStateMixin {
  final String orderId;
  final viewModel = GetIt.I<OrderDetailsViewModel>();

  OrderDetailsPage({
    super.key,
    required this.orderId,
  });

  @override
  void initState() {
    viewModel.fetch(orderId);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (context) {
        final order = viewModel.order;
        if (order == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final formatter = OrderFormatter(order);
        return Scaffold(
          appBar: AppBar(
            title: Text('Pedido #${order.orderNumber}'),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline_sharp),
                  title: const Text('Status'),
                  trailing: Text(
                    formatter.statusText,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: formatter.statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title: const Text('Endereço de entrega'),
                  subtitle: Text(formatter.shippingAddress),
                ),
                ListTile(
                  leading: const Icon(Icons.person_outline_outlined),
                  title: const Text('Destinatário'),
                  trailing: Text(
                    order.shippingAddress.recipientName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: const Text('Total'),
                  trailing: Text(
                    CurrencyFormatter().format(order.total),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                ExpansionTile(
                  leading: const Icon(Icons.receipt_long_outlined),
                  initiallyExpanded: true,
                  title: Text('Itens (${order.items.length})'),
                  children: order.items
                      .map(
                        (item) => ListTile(
                          minVerticalPadding: 16,
                          leading: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                            ),
                            child: Image.network(item.productVariant.image.toString()),
                          ),
                          title: Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text.rich(
                            TextSpan(
                              text: '${item.quantity} un.\n',
                              style: Theme.of(context).textTheme.labelSmall,
                              children: [
                                TextSpan(
                                  text: CurrencyFormatter().format(item.total),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            TextButton.icon(
              onPressed: () => throw UnimplementedError(),
              icon: const Icon(Icons.help_outline),
              label: const Text('Preciso de ajuda'),
            ),
          ],
        );
      },
    );
  }
}
