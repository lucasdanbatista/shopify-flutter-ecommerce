import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../features/cart/cart_view_model.dart';
import '../utils/formatters/currency_formatter.dart';

class OrderSummaryLine {
  final String title;
  final String value;

  OrderSummaryLine({
    required this.title,
    required this.value,
  });
}

class OrderSummary extends StatelessWidget {
  final cartViewModel = GetIt.I<CartViewModel>();
  final String confirmationButtonText;
  final VoidCallback onConfirmationButtonPressed;
  final List<OrderSummaryLine> additionalLines;

  OrderSummary({
    super.key,
    required this.confirmationButtonText,
    required this.onConfirmationButtonPressed,
    this.additionalLines = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 8)),
          _renderLines(
            context,
            [
              ...additionalLines,
              OrderSummaryLine(
                title: 'Subtotal',
                value: CurrencyFormatter().format(cartViewModel.cart.subtotal),
              ),
              OrderSummaryLine(
                title: 'Total',
                value: CurrencyFormatter().format(cartViewModel.cart.total),
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

  Widget _renderLines(BuildContext context, List<OrderSummaryLine> lines) {
    return Column(
      children: lines
          .map(
            (line) => ListTile(
              title: Text(
                line.title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Text(
                line.value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          )
          .toList(),
    );
  }
}
