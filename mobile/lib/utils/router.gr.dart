// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:vienna/core/entities/home_banner.dart' as _i17;
import 'package:vienna/core/entities/product_category.dart' as _i18;
import 'package:vienna/features/banner_details/banner_details_page.dart' as _i1;
import 'package:vienna/features/cart/cart_page.dart' as _i2;
import 'package:vienna/features/categories/categories_page.dart' as _i3;
import 'package:vienna/features/category_details/category_details_page.dart'
    as _i4;
import 'package:vienna/features/checkout/checkout_page.dart' as _i5;
import 'package:vienna/features/home/home_page.dart' as _i6;
import 'package:vienna/features/order_details/order_details_page.dart' as _i7;
import 'package:vienna/features/orders/orders_page.dart' as _i8;
import 'package:vienna/features/product_details/product_details_page.dart'
    as _i9;
import 'package:vienna/features/profile/profile_page.dart' as _i10;
import 'package:vienna/features/sign_in/sign_in_page.dart' as _i11;
import 'package:vienna/features/sign_up/sign_up_page.dart' as _i12;
import 'package:vienna/features/splash/splash_page.dart' as _i13;
import 'package:vienna/features/wishlist/wishlist_page.dart' as _i14;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    BannerDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BannerDetailsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BannerDetailsPage(
          key: args.key,
          banner: args.banner,
        ),
      );
    },
    CartRoute.name: (routeData) {
      final args =
          routeData.argsAs<CartRouteArgs>(orElse: () => const CartRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CartPage(key: args.key),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CategoriesPage(),
      );
    },
    CategoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CategoryDetailsPage(
          key: args.key,
          category: args.category,
        ),
      );
    },
    CheckoutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CheckoutPage(
          key: args.key,
          checkoutUrl: args.checkoutUrl,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomePage(key: args.key),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
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
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.OrdersPage(key: args.key),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
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
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ProfilePage(key: args.key),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SignInPage(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.SignUpPage(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.SplashPage(key: args.key),
      );
    },
    WishlistRoute.name: (routeData) {
      final args = routeData.argsAs<WishlistRouteArgs>(
          orElse: () => const WishlistRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WishlistPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.BannerDetailsPage]
class BannerDetailsRoute extends _i15.PageRouteInfo<BannerDetailsRouteArgs> {
  BannerDetailsRoute({
    _i16.Key? key,
    required _i17.HomeBanner banner,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          BannerDetailsRoute.name,
          args: BannerDetailsRouteArgs(
            key: key,
            banner: banner,
          ),
          initialChildren: children,
        );

  static const String name = 'BannerDetailsRoute';

  static const _i15.PageInfo<BannerDetailsRouteArgs> page =
      _i15.PageInfo<BannerDetailsRouteArgs>(name);
}

class BannerDetailsRouteArgs {
  const BannerDetailsRouteArgs({
    this.key,
    required this.banner,
  });

  final _i16.Key? key;

  final _i17.HomeBanner banner;

  @override
  String toString() {
    return 'BannerDetailsRouteArgs{key: $key, banner: $banner}';
  }
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i15.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CartRoute.name,
          args: CartRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i15.PageInfo<CartRouteArgs> page =
      _i15.PageInfo<CartRouteArgs>(name);
}

class CartRouteArgs {
  const CartRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CategoriesPage]
class CategoriesRoute extends _i15.PageRouteInfo<void> {
  const CategoriesRoute({List<_i15.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CategoryDetailsPage]
class CategoryDetailsRoute
    extends _i15.PageRouteInfo<CategoryDetailsRouteArgs> {
  CategoryDetailsRoute({
    _i16.Key? key,
    required _i18.ProductCategory category,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CategoryDetailsRoute.name,
          args: CategoryDetailsRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailsRoute';

  static const _i15.PageInfo<CategoryDetailsRouteArgs> page =
      _i15.PageInfo<CategoryDetailsRouteArgs>(name);
}

class CategoryDetailsRouteArgs {
  const CategoryDetailsRouteArgs({
    this.key,
    required this.category,
  });

  final _i16.Key? key;

  final _i18.ProductCategory category;

  @override
  String toString() {
    return 'CategoryDetailsRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i5.CheckoutPage]
class CheckoutRoute extends _i15.PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({
    _i16.Key? key,
    required Uri checkoutUrl,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CheckoutRoute.name,
          args: CheckoutRouteArgs(
            key: key,
            checkoutUrl: checkoutUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const _i15.PageInfo<CheckoutRouteArgs> page =
      _i15.PageInfo<CheckoutRouteArgs>(name);
}

class CheckoutRouteArgs {
  const CheckoutRouteArgs({
    this.key,
    required this.checkoutUrl,
  });

  final _i16.Key? key;

  final Uri checkoutUrl;

  @override
  String toString() {
    return 'CheckoutRouteArgs{key: $key, checkoutUrl: $checkoutUrl}';
  }
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i15.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<HomeRouteArgs> page =
      _i15.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.OrderDetailsPage]
class OrderDetailsRoute extends _i15.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i16.Key? key,
    required String orderId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          OrderDetailsRoute.name,
          args: OrderDetailsRouteArgs(
            key: key,
            orderId: orderId,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static const _i15.PageInfo<OrderDetailsRouteArgs> page =
      _i15.PageInfo<OrderDetailsRouteArgs>(name);
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    this.key,
    required this.orderId,
  });

  final _i16.Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i8.OrdersPage]
class OrdersRoute extends _i15.PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          OrdersRoute.name,
          args: OrdersRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const _i15.PageInfo<OrdersRouteArgs> page =
      _i15.PageInfo<OrdersRouteArgs>(name);
}

class OrdersRouteArgs {
  const OrdersRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'OrdersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ProductDetailsPage]
class ProductDetailsRoute extends _i15.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i16.Key? key,
    required String productId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i15.PageInfo<ProductDetailsRouteArgs> page =
      _i15.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final _i16.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i15.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i15.PageInfo<ProfileRouteArgs> page =
      _i15.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.SignInPage]
class SignInRoute extends _i15.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i15.PageInfo<SignInRouteArgs> page =
      _i15.PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.SignUpPage]
class SignUpRoute extends _i15.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i15.PageInfo<SignUpRouteArgs> page =
      _i15.PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<SplashRouteArgs> page =
      _i15.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.WishlistPage]
class WishlistRoute extends _i15.PageRouteInfo<WishlistRouteArgs> {
  WishlistRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          WishlistRoute.name,
          args: WishlistRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WishlistRoute';

  static const _i15.PageInfo<WishlistRouteArgs> page =
      _i15.PageInfo<WishlistRouteArgs>(name);
}

class WishlistRouteArgs {
  const WishlistRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'WishlistRouteArgs{key: $key}';
  }
}
