import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/assets.dart';
import '../../utils/router.gr.dart';
import '../../widgets/icon_buttons/cart_icon_button.dart';
import '../search/search_page.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              title: const Text('Meus endereços'),
              leading: const Icon(Icons.location_on_outlined),
              onTap: () => context.pushRoute(AddressesRoute()),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              title: const Text('Meus pedidos'),
              leading: const Icon(Icons.receipt_long_outlined),
              onTap: () => context.pushRoute(OrdersRoute()),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              title: const Text('Meus favoritos'),
              leading: const Icon(Icons.favorite_outline),
              onTap: () => context.pushRoute(WishlistRoute()),
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
            onPressed: () => Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const SearchPage(),
                transitionsBuilder: (_, animation, ___, child) =>
                    SlideTransition(
                  position: animation.drive(
                    Tween(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ),
                  ),
                  child: child,
                ),
              ),
            ),
            icon: const Icon(Icons.search),
          ),
          CartIconButton(),
        ],
      ),
    );
  }
}
