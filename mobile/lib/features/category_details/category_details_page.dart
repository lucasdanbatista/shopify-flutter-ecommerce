import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/product.dart';
import '../../rx/observable_widget.dart';
import '../../rx/observed_data.dart';
import '../../util/formatters/currency_formatter.dart';
import '../../util/init_state_mixin.dart';
import '../../util/router.gr.dart';
import 'category_details_view_model.dart';

@RoutePage()
class CategoryDetailsPage extends StatelessWidget with InitStateMixin {
  final String categoryId;
  final viewModel = GetIt.I<CategoryDetailsViewModel>();

  CategoryDetailsPage({
    super.key,
    required this.categoryId,
  });

  @override
  void initState() {
    viewModel.fetch(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ObservableWidget(
        observable: viewModel.products,
        builder: (context, data) {
          if (data is FoundData<List<Product>>) {
            return Scaffold(
              appBar: AppBar(
                title: Text(categoryId),
              ),
              body: GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: data.value
                    .map(
                      (product) => GestureDetector(
                        onTap: () => context.pushRoute(
                          ProductDetailsRoute(
                            productId: product.id,
                          ),
                        ),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            border: Border.all(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  product.images.first.toString(),
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.width,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 4),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: CurrencyFormatter().format(
                                          product.variants.first.originalPrice,
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '\n${CurrencyFormatter().format(
                                              product
                                                  .variants.first.sellingPrice,
                                            )}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
