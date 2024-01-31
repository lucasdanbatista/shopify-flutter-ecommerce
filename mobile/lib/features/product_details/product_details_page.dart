import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/formatters/currency_formatter.dart';
import '../../util/init_state_mixin.dart';
import '../../util/router.gr.dart';
import '../cart/cart_view_model.dart';
import '../wishlist/wishlist_view_model.dart';
import 'product_details_view_model.dart';

@RoutePage()
class ProductDetailsPage extends StatelessWidget with InitStateMixin {
  final String productId;
  final productViewModel = GetIt.I<ProductDetailsViewModel>();
  final cartViewModel = GetIt.I<CartViewModel>();
  final wishlistViewModel = GetIt.I<WishlistViewModel>();

  ProductDetailsPage({
    super.key,
    required this.productId,
  });

  @override
  void initState() {
    cartViewModel.refreshCart();
    productViewModel.fetch(productId);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (context) {
        final product = productViewModel.product;
        if (product == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detalhes do produto'),
            actions: [
              Observer(
                builder: (context) => IconButton(
                  onPressed: () => wishlistViewModel.toggleFavorite(product),
                  isSelected: wishlistViewModel.isFavorite(product),
                  icon: const Icon(Icons.favorite_border),
                  selectedIcon: const Icon(Icons.favorite),
                ),
              ),
              IconButton(
                onPressed: () => context.pushRoute(CartRoute()),
                icon: Badge.count(
                  isLabelVisible: cartViewModel.cart.lines.isNotEmpty,
                  count: cartViewModel.cart.lines.length,
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: PageView(
                    clipBehavior: Clip.none,
                    controller: PageController(
                      viewportFraction: 0.99,
                    ),
                    children: product.images
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.only(
                              right: e != product.images.last ? 12 : 0,
                            ),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                border: Border.all(
                                  color: Colors.grey.shade100,
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                              ),
                              child: Image.network(
                                e.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 32)),
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                Text.rich(
                  TextSpan(
                    text: '${CurrencyFormatter().format(
                      product.variants.first.originalPrice,
                    )}\n',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                    children: [
                      TextSpan(
                        text: CurrencyFormatter().format(
                          product.variants.first.sellingPrice,
                        ),
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                Text(
                  'Descrição',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Padding(padding: EdgeInsets.only(top: 12)),
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Padding(padding: EdgeInsets.only(top: 72)),
              ],
            ),
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            Observer(
              builder: (context) {
                final canContinueToPayment =
                    productViewModel.addedToCart && cartViewModel.cart.lines.isNotEmpty;
                return TextButton.icon(
                  onPressed: canContinueToPayment
                      ? () => context.pushRoute(CartRoute())
                      : () async {
                          await cartViewModel.addCartLine(product.variants.first.id);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Adicionado ao carrinho'),
                              ),
                            );
                            productViewModel.setAddedToCart(true);
                          }
                        },
                  icon: Icon(
                    canContinueToPayment ? Icons.check_outlined : Icons.add_shopping_cart_outlined,
                  ),
                  label: Text(
                    canContinueToPayment ? 'FECHAR PEDIDO' : 'ADICIONAR AO CARRINHO',
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
