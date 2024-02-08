import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../util/formatters/currency_formatter.dart';
import '../cart_view_model.dart';

class OrderSummary extends StatelessWidget {
  final cartViewModel = GetIt.I<CartViewModel>();
  final String confirmationButtonText;
  final VoidCallback onConfirmationButtonPressed;

  OrderSummary({
    super.key,
    required this.confirmationButtonText,
    required this.onConfirmationButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 8)),
          Column(
            children: [
              ListTile(
                title: Text(
                  'Subtotal',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: Text(
                  CurrencyFormatter().format(cartViewModel.cart.subtotal),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              ListTile(
                minVerticalPadding: 0,
                title: Text(
                  'Total',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: Text(
                  CurrencyFormatter().format(cartViewModel.cart.total),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          Visibility(
            visible: cartViewModel.cart.lines.isNotEmpty,
            child: Center(
              child: TextButton(
                onPressed: onConfirmationButtonPressed,
                child: Text(confirmationButtonText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
