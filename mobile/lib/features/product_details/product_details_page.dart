import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/formatters/currency_formatter.dart';
import '../../util/init_state_mixin.dart';
import 'product_details_view_model.dart';

@RoutePage()
class ProductDetailsPage extends StatelessWidget with InitStateMixin {
  final String productId;
  final viewModel = GetIt.I<ProductDetailsViewModel>();

  ProductDetailsPage({
    super.key,
    required this.productId,
  });

  @override
  void initState() {
    viewModel.fetch(productId);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (context) {
        final product = viewModel.product;
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
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            clipBehavior: Clip.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
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
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
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
        );
      },
    );
  }
}
