import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/product_category.dart';
import '../../utils/formatters/currency_formatter.dart';
import '../../utils/init_state_mixin.dart';
import '../../utils/router.gr.dart';
import 'category_details_view_model.dart';

@RoutePage()
class CategoryDetailsPage extends StatelessWidget with InitStateMixin {
  final ProductCategory category;
  final viewModel = GetIt.I<CategoryDetailsViewModel>();

  CategoryDetailsPage({
    super.key,
    required this.category,
  });

  @override
  void initState() {
    viewModel.fetch(category.id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Observer(
        builder: (context) => GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: viewModel.products
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
                            height: double.infinity,
                            width: double.infinity,
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
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                  children: [
                                    TextSpan(
                                      text: '\n${CurrencyFormatter().format(
                                        product.variants.first.sellingPrice,
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
      ),
    );
  }
}
