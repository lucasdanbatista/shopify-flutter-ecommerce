// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:vienna/core/entities/product_category.dart' as _i15;
import 'package:vienna/features/address_form/address_form_page.dart' as _i1;
import 'package:vienna/features/cart/cart_page.dart' as _i2;
import 'package:vienna/features/categories/categories_page.dart' as _i3;
import 'package:vienna/features/category_details/category_details_page.dart'
    as _i4;
import 'package:vienna/features/home/home_page.dart' as _i5;
import 'package:vienna/features/order_details/order_details_page.dart' as _i6;
import 'package:vienna/features/orders/orders_page.dart' as _i7;
import 'package:vienna/features/product_details/product_details_page.dart'
    as _i8;
import 'package:vienna/features/profile/profile_page.dart' as _i9;
import 'package:vienna/features/sign_in/sign_in_page.dart' as _i10;
import 'package:vienna/features/splash/splash_page.dart' as _i11;
import 'package:vienna/features/wishlist/wishlist_page.dart' as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AddressFormRoute.name: (routeData) {
      final args = routeData.argsAs<AddressFormRouteArgs>(
          orElse: () => const AddressFormRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddressFormPage(key: args.key),
      );
    },
    CartRoute.name: (routeData) {
      final args =
          routeData.argsAs<CartRouteArgs>(orElse: () => const CartRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CartPage(key: args.key),
      );
    },
    CategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<CategoriesRouteArgs>(
          orElse: () => const CategoriesRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CategoriesPage(key: args.key),
      );
    },
    CategoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailsRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CategoryDetailsPage(
          key: args.key,
          category: args.category,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.OrderDetailsPage(
          key: args.key,
          orderId: args.orderId,
        ),
      );
    },
    OrdersRoute.name: (routeData) {
      final args = routeData.argsAs<OrdersRouteArgs>(
          orElse: () => const OrdersRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.OrdersPage(key: args.key),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ProductDetailsPage(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ProfilePage(key: args.key),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SignInPage(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SplashPage(key: args.key),
      );
    },
    WishlistRoute.name: (routeData) {
      final args = routeData.argsAs<WishlistRouteArgs>(
          orElse: () => const WishlistRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WishlistPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AddressFormPage]
class AddressFormRoute extends _i13.PageRouteInfo<AddressFormRouteArgs> {
  AddressFormRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          AddressFormRoute.name,
          args: AddressFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddressFormRoute';

  static const _i13.PageInfo<AddressFormRouteArgs> page =
      _i13.PageInfo<AddressFormRouteArgs>(name);
}

class AddressFormRouteArgs {
  const AddressFormRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'AddressFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i13.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          CartRoute.name,
          args: CartRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i13.PageInfo<CartRouteArgs> page =
      _i13.PageInfo<CartRouteArgs>(name);
}

class CartRouteArgs {
  const CartRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CategoriesPage]
class CategoriesRoute extends _i13.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          CategoriesRoute.name,
          args: CategoriesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i13.PageInfo<CategoriesRouteArgs> page =
      _i13.PageInfo<CategoriesRouteArgs>(name);
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CategoryDetailsPage]
class CategoryDetailsRoute
    extends _i13.PageRouteInfo<CategoryDetailsRouteArgs> {
  CategoryDetailsRoute({
    _i14.Key? key,
    required _i15.ProductCategory category,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          CategoryDetailsRoute.name,
          args: CategoryDetailsRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailsRoute';

  static const _i13.PageInfo<CategoryDetailsRouteArgs> page =
      _i13.PageInfo<CategoryDetailsRouteArgs>(name);
}

class CategoryDetailsRouteArgs {
  const CategoryDetailsRouteArgs({
    this.key,
    required this.category,
  });

  final _i14.Key? key;

  final _i15.ProductCategory category;

  @override
  String toString() {
    return 'CategoryDetailsRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OrderDetailsPage]
class OrderDetailsRoute extends _i13.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i14.Key? key,
    required String orderId,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          OrderDetailsRoute.name,
          args: OrderDetailsRouteArgs(
            key: key,
            orderId: orderId,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static const _i13.PageInfo<OrderDetailsRouteArgs> page =
      _i13.PageInfo<OrderDetailsRouteArgs>(name);
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    this.key,
    required this.orderId,
  });

  final _i14.Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i7.OrdersPage]
class OrdersRoute extends _i13.PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          OrdersRoute.name,
          args: OrdersRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const _i13.PageInfo<OrdersRouteArgs> page =
      _i13.PageInfo<OrdersRouteArgs>(name);
}

class OrdersRouteArgs {
  const OrdersRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'OrdersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ProductDetailsPage]
class ProductDetailsRoute extends _i13.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i14.Key? key,
    required String productId,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i13.PageInfo<ProductDetailsRouteArgs> page =
      _i13.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final _i14.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i13.PageInfo<ProfileRouteArgs> page =
      _i13.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.SignInPage]
class SignInRoute extends _i13.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i13.PageInfo<SignInRouteArgs> page =
      _i13.PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<SplashRouteArgs> page =
      _i13.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.WishlistPage]
class WishlistRoute extends _i13.PageRouteInfo<WishlistRouteArgs> {
  WishlistRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          WishlistRoute.name,
          args: WishlistRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WishlistRoute';

  static const _i13.PageInfo<WishlistRouteArgs> page =
      _i13.PageInfo<WishlistRouteArgs>(name);
}

class WishlistRouteArgs {
  const WishlistRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'WishlistRouteArgs{key: $key}';
  }
}
