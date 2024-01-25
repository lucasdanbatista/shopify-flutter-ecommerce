import 'package:flutter/material.dart';

import '../../util/route.dart';
import '../product_details/product_details_page.dart';
import '../product_details/product_details_route.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amostras'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Detalhes do produto'),
            onTap: () => context.pushRoute(
              ProductDetailsRoute(),
              args: ProductDetailsArguments(
                productId: '6978987819094',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
