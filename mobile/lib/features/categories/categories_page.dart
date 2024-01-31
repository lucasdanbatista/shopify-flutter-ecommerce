import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/init_state_mixin.dart';
import '../../util/router.gr.dart';
import '../wishlist/wishlist_view_model.dart';
import 'categories_view_model.dart';

@RoutePage()
class CategoriesPage extends StatelessWidget with InitStateMixin {
  final categoriesViewModel = GetIt.I<CategoriesViewModel>();
  final wishlistViewModel = GetIt.I<WishlistViewModel>();

  CategoriesPage({super.key});

  @override
  void initState() {
    categoriesViewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        actions: [
          IconButton(
            onPressed: () => context.pushRoute(WishlistRoute()),
            icon: Observer(
              builder: (context) => Badge.count(
                isLabelVisible: wishlistViewModel.wishlist.isNotEmpty,
                count: wishlistViewModel.wishlist.length,
                child: const Icon(Icons.favorite_border),
              ),
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: categoriesViewModel.categories.length,
          itemBuilder: (context, index) {
            final category = categoriesViewModel.categories[index];
            return ListTile(
              minVerticalPadding: 20,
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  Icons.category_outlined,
                  color: Colors.grey.shade600,
                ),
              ),
              title: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              onTap: () => context.pushRoute(
                CategoryDetailsRoute(
                  categoryId: category.id,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
