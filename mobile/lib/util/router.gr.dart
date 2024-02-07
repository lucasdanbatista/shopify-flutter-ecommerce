// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:vienna/core/entities/product_category.dart' as _i16;
import 'package:vienna/features/address_form/address_form_page.dart' as _i1;
import 'package:vienna/features/addresses/addresses_page.dart' as _i2;
import 'package:vienna/features/cart/cart_page.dart' as _i3;
import 'package:vienna/features/categories/categories_page.dart' as _i4;
import 'package:vienna/features/category_details/category_details_page.dart'
    as _i5;
import 'package:vienna/features/home/home_page.dart' as _i6;
import 'package:vienna/features/order_details/order_details_page.dart' as _i7;
import 'package:vienna/features/orders/orders_page.dart' as _i8;
import 'package:vienna/features/product_details/product_details_page.dart'
    as _i9;
import 'package:vienna/features/profile/profile_page.dart' as _i10;
import 'package:vienna/features/sign_in/sign_in_page.dart' as _i11;
import 'package:vienna/features/splash/splash_page.dart' as _i12;
import 'package:vienna/features/wishlist/wishlist_page.dart' as _i13;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AddressFormRoute.name: (routeData) {
      final args = routeData.argsAs<AddressFormRouteArgs>(
          orElse: () => const AddressFormRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddressFormPage(key: args.key),
      );
    },
    AddressesRoute.name: (routeData) {
      final args = routeData.argsAs<AddressesRouteArgs>(
          orElse: () => const AddressesRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddressesPage(key: args.key),
      );
    },
    CartRoute.name: (routeData) {
      final args =
          routeData.argsAs<CartRouteArgs>(orElse: () => const CartRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CartPage(key: args.key),
      );
    },
    CategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<CategoriesRouteArgs>(
          orElse: () => const CategoriesRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CategoriesPage(key: args.key),
      );
    },
    CategoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailsRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CategoryDetailsPage(
          key: args.key,
          category: args.category,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.OrderDetailsPage(
          key: args.key,
          orderId: args.orderId,
        ),
      );
    },
    OrdersRoute.name: (routeData) {
      final args = routeData.argsAs<OrdersRouteArgs>(
          orElse: () => const OrdersRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.OrdersPage(key: args.key),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ProductDetailsPage(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ProfilePage(key: args.key),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SignInPage(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.SplashPage(key: args.key),
      );
    },
    WishlistRoute.name: (routeData) {
      final args = routeData.argsAs<WishlistRouteArgs>(
          orElse: () => const WishlistRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WishlistPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AddressFormPage]
class AddressFormRoute extends _i14.PageRouteInfo<AddressFormRouteArgs> {
  AddressFormRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          AddressFormRoute.name,
          args: AddressFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddressFormRoute';

  static const _i14.PageInfo<AddressFormRouteArgs> page =
      _i14.PageInfo<AddressFormRouteArgs>(name);
}

class AddressFormRouteArgs {
  const AddressFormRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'AddressFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AddressesPage]
class AddressesRoute extends _i14.PageRouteInfo<AddressesRouteArgs> {
  AddressesRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          AddressesRoute.name,
          args: AddressesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddressesRoute';

  static const _i14.PageInfo<AddressesRouteArgs> page =
      _i14.PageInfo<AddressesRouteArgs>(name);
}

class AddressesRouteArgs {
  const AddressesRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'AddressesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CartPage]
class CartRoute extends _i14.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CartRoute.name,
          args: CartRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i14.PageInfo<CartRouteArgs> page =
      _i14.PageInfo<CartRouteArgs>(name);
}

class CartRouteArgs {
  const CartRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CategoriesPage]
class CategoriesRoute extends _i14.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CategoriesRoute.name,
          args: CategoriesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i14.PageInfo<CategoriesRouteArgs> page =
      _i14.PageInfo<CategoriesRouteArgs>(name);
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.CategoryDetailsPage]
class CategoryDetailsRoute
    extends _i14.PageRouteInfo<CategoryDetailsRouteArgs> {
  CategoryDetailsRoute({
    _i15.Key? key,
    required _i16.ProductCategory category,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CategoryDetailsRoute.name,
          args: CategoryDetailsRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailsRoute';

  static const _i14.PageInfo<CategoryDetailsRouteArgs> page =
      _i14.PageInfo<CategoryDetailsRouteArgs>(name);
}

class CategoryDetailsRouteArgs {
  const CategoryDetailsRouteArgs({
    this.key,
    required this.category,
  });

  final _i15.Key? key;

  final _i16.ProductCategory category;

  @override
  String toString() {
    return 'CategoryDetailsRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OrderDetailsPage]
class OrderDetailsRoute extends _i14.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i15.Key? key,
    required String orderId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          OrderDetailsRoute.name,
          args: OrderDetailsRouteArgs(
            key: key,
            orderId: orderId,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static const _i14.PageInfo<OrderDetailsRouteArgs> page =
      _i14.PageInfo<OrderDetailsRouteArgs>(name);
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    this.key,
    required this.orderId,
  });

  final _i15.Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i8.OrdersPage]
class OrdersRoute extends _i14.PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          OrdersRoute.name,
          args: OrdersRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const _i14.PageInfo<OrdersRouteArgs> page =
      _i14.PageInfo<OrdersRouteArgs>(name);
}

class OrdersRouteArgs {
  const OrdersRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'OrdersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ProductDetailsPage]
class ProductDetailsRoute extends _i14.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i15.Key? key,
    required String productId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i14.PageInfo<ProductDetailsRouteArgs> page =
      _i14.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final _i15.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i14.PageInfo<ProfileRouteArgs> page =
      _i14.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.SignInPage]
class SignInRoute extends _i14.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i14.PageInfo<SignInRouteArgs> page =
      _i14.PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i14.PageInfo<SplashRouteArgs> page =
      _i14.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.WishlistPage]
class WishlistRoute extends _i14.PageRouteInfo<WishlistRouteArgs> {
  WishlistRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          WishlistRoute.name,
          args: WishlistRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WishlistRoute';

  static const _i14.PageInfo<WishlistRouteArgs> page =
      _i14.PageInfo<WishlistRouteArgs>(name);
}

class WishlistRouteArgs {
  const WishlistRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'WishlistRouteArgs{key: $key}';
  }
}
