import 'package:flutter/material.dart';

import '../../core/entities/product.dart';
import '../../rx/observable_widget.dart';
import '../../rx/observed_data.dart';
import '../../util/formatters/currency_formatter.dart';
import '../../util/init_state_mixin.dart';
import '../../util/route.dart';
import 'product_details_view_model.dart';

class ProductDetailsArguments implements RouteArguments {
  final String productId;

  ProductDetailsArguments({
    required this.productId,
  });
}

class ProductDetailsPage extends StatelessWidget with InitStateMixin {
  final ProductDetailsArguments args;
  final ProductDetailsViewModel viewModel;

  const ProductDetailsPage({
    super.key,
    required this.args,
    required this.viewModel,
  });

  @override
  void initState() {
    viewModel.fetch(args.productId);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ObservableWidget(
        observable: viewModel.product,
        builder: (context, data) {
          if (data is FoundData<Product>) {
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
                        children: data.value.images
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.only(
                                  right: e != data.value.images.last ? 12 : 0,
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
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
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
                      data.value.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16)),
                    Text.rich(
                      TextSpan(
                        text: '${CurrencyFormatter().format(
                          data.value.variants.first.originalPrice,
                        )}\n',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                        children: [
                          TextSpan(
                            text: CurrencyFormatter().format(
                              data.value.variants.first.sellingPrice,
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
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
                      data.value.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 72)),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
