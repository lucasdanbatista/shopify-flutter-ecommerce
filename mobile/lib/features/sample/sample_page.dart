import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../util/router.gr.dart';

@RoutePage()
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
