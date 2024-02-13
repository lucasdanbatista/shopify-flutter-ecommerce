import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/entities/product.dart';
import '../../utils/formatters/currency_formatter.dart';
import '../../utils/router.gr.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(
        ProductDetailsRoute(productId: product.id),
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
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                      children: [
                        TextSpan(
                          text: '\n${CurrencyFormatter().format(
                            product.variants.first.sellingPrice,
                          )}',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
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
    );
  }
}
