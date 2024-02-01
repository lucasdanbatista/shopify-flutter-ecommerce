import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/router.gr.dart';
import '../catalog/catalog_page.dart';
import '../categories/categories_page.dart';
import '../profile/profile_page.dart';
import '../wishlist/wishlist_view_model.dart';
import 'home_view_model.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  final wishlistViewModel = GetIt.I<WishlistViewModel>();
  final viewModel = GetIt.I<HomeViewModel>();
  late final pageController = PageController(
    keepPage: true,
    initialPage: viewModel.initialPage,
  );

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Placeholder(),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              title: const Text('Meus pedidos'),
              leading: const Icon(Icons.receipt_long_outlined),
              onTap: () => context.pushRoute(OrdersRoute()),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Observer(
          builder: (context) => Text(viewModel.pageTitle),
        ),
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
      body: PageView(
        onPageChanged: viewModel.setCurrentPageIndex,
        controller: pageController,
        children: [
          CategoriesPage(),
          const CatalogPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: Observer(
        builder: (context) => BottomNavigationBar(
          currentIndex: viewModel.currentPageIndex,
          showUnselectedLabels: false,
          onTap: (index) {
            viewModel.setCurrentPageIndex(index);
            pageController.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined),
              label: 'Catálogo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
