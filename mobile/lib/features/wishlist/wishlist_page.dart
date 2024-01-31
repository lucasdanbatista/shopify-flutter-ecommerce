import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/formatters/currency_formatter.dart';
import '../../util/init_state_mixin.dart';
import '../../util/router.gr.dart';
import 'wishlist_view_model.dart';

@RoutePage()
class WishlistPage extends StatelessWidget with InitStateMixin {
  final viewModel = GetIt.I<WishlistViewModel>();

  WishlistPage({super.key});

  @override
  void initState() {
    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: viewModel.wishlist.length,
          itemBuilder: (context, index) {
            final product = viewModel.wishlist[index];
            return ListTile(
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
                child: Image.network(product.images.first.toString()),
              ),
              minVerticalPadding: 16,
              title: Text(product.title),
              trailing: Text.rich(
                TextSpan(
                  text: '${CurrencyFormatter().format(product.variants.first.originalPrice)}\n',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(decoration: TextDecoration.lineThrough),
                  children: [
                    TextSpan(
                      text: CurrencyFormatter().format(product.variants.first.sellingPrice),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                textAlign: TextAlign.end,
              ),
              onTap: () => context.pushRoute(ProductDetailsRoute(productId: product.id)),
            );
          },
        ),
      ),
    );
  }
}
