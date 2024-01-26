import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/assets.dart';
import '../../util/formatters/currency_formatter.dart';
import '../../util/init_state_mixin.dart';
import 'cart_view_model.dart';

@RoutePage()
class CartPage extends StatelessWidget with InitStateMixin {
  final viewModel = GetIt.I<CartViewModel>();

  CartPage({super.key});

  @override
  void initState() {
    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Observer(
        builder: (context) {
          final cart = viewModel.cart;
          if (cart == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (cart.lines.isEmpty) {
            return Center(
              child: Wrap(
                spacing: 32,
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    PngAssets.emptyCartIllustration,
                    height: 156,
                  ),
                  const Text('Seu carrinho está vazio'),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: cart.lines.length,
            itemBuilder: (context, index) {
              final cartLine = cart.lines[index];
              return ListTile(
                title: Text(cartLine.productVariant.title),
                subtitle: Text(CurrencyFormatter().format(cartLine.total)),
                onTap: () {},
                minVerticalPadding: 24,
                contentPadding: const EdgeInsets.only(left: 16, right: 8),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => viewModel.updateCartLine(
                        cartLineId: cartLine.id,
                        quantity: cartLine.quantity - 1,
                      ),
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      cartLine.quantity.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    IconButton(
                      onPressed: () => viewModel.updateCartLine(
                        cartLineId: cartLine.id,
                        quantity: cartLine.quantity + 1,
                      ),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      cartLine.productVariant.image.toString(),
                      fit: BoxFit.contain,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      persistentFooterAlignment: AlignmentDirectional.topStart,
      persistentFooterButtons: [
        Observer(
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
                      CurrencyFormatter().format(
                        viewModel.cart?.subtotal ?? 0,
                      ),
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
                      CurrencyFormatter().format(
                        viewModel.cart?.total ?? 0,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: viewModel.cart?.lines.isNotEmpty == true,
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('FECHAR PEDIDO'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
