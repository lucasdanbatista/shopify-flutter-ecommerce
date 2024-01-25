import 'package:flutter/material.dart';

import '../../util/route.dart';
import '../categories/categories_route.dart';

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
            leading: const Icon(Icons.category_outlined),
            title: const Text('Categorias'),
            onTap: () => context.pushRoute(CategoriesRoute()),
          ),
        ],
      ),
    );
  }
}
