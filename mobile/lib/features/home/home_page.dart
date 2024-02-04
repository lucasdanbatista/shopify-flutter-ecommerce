import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/assets.dart';
import '../../util/router.gr.dart';
import '../wishlist/wishlist_view_model.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  final wishlistViewModel = GetIt.I<WishlistViewModel>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                color: ColorAssets.storeLogoTransparentBackgroundColor,
                child: Image.asset(
                  ImageAssets.storeLogoTransparent,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              title: const Text('Minha conta'),
              leading: const Icon(Icons.account_circle_outlined),
              onTap: () => context.pushRoute(ProfileRoute()),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              title: const Text('Meus pedidos'),
              leading: const Icon(Icons.receipt_long_outlined),
              onTap: () => context.pushRoute(OrdersRoute()),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              title: const Text('Categorias'),
              leading: const Icon(Icons.category_outlined),
              onTap: () => context.pushRoute(CategoriesRoute()),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Vienna'),
        actions: [
          IconButton(
            onPressed: () => throw UnimplementedError(),
            icon: const Icon(Icons.search),
          ),
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
    );
  }
}
