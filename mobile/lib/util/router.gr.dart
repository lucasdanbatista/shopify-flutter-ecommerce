// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:vienna/features/cart/cart_page.dart' as _i1;
import 'package:vienna/features/categories/categories_page.dart' as _i2;
import 'package:vienna/features/category_details/category_details_page.dart'
    as _i3;
import 'package:vienna/features/product_details/product_details_page.dart'
    as _i4;
import 'package:vienna/features/sign_in/sign_in_page.dart' as _i5;
import 'package:vienna/features/splash/splash_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    CartRoute.name: (routeData) {
      final args =
          routeData.argsAs<CartRouteArgs>(orElse: () => const CartRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CartPage(key: args.key),
      );
    },
    CategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<CategoriesRouteArgs>(
          orElse: () => const CategoriesRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CategoriesPage(key: args.key),
      );
    },
    CategoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CategoryDetailsPage(
          key: args.key,
          categoryId: args.categoryId,
        ),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ProductDetailsPage(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.SignInPage(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SplashPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i7.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CartRoute.name,
          args: CartRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i7.PageInfo<CartRouteArgs> page =
      _i7.PageInfo<CartRouteArgs>(name);
}

class CartRouteArgs {
  const CartRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.CategoriesPage]
class CategoriesRoute extends _i7.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CategoriesRoute.name,
          args: CategoriesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i7.PageInfo<CategoriesRouteArgs> page =
      _i7.PageInfo<CategoriesRouteArgs>(name);
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CategoryDetailsPage]
class CategoryDetailsRoute extends _i7.PageRouteInfo<CategoryDetailsRouteArgs> {
  CategoryDetailsRoute({
    _i8.Key? key,
    required String categoryId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CategoryDetailsRoute.name,
          args: CategoryDetailsRouteArgs(
            key: key,
            categoryId: categoryId,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailsRoute';

  static const _i7.PageInfo<CategoryDetailsRouteArgs> page =
      _i7.PageInfo<CategoryDetailsRouteArgs>(name);
}

class CategoryDetailsRouteArgs {
  const CategoryDetailsRouteArgs({
    this.key,
    required this.categoryId,
  });

  final _i8.Key? key;

  final String categoryId;

  @override
  String toString() {
    return 'CategoryDetailsRouteArgs{key: $key, categoryId: $categoryId}';
  }
}

/// generated route for
/// [_i4.ProductDetailsPage]
class ProductDetailsRoute extends _i7.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i8.Key? key,
    required String productId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i7.PageInfo<ProductDetailsRouteArgs> page =
      _i7.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final _i8.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i5.SignInPage]
class SignInRoute extends _i7.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i7.PageInfo<SignInRouteArgs> page =
      _i7.PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<SplashRouteArgs> page =
      _i7.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}
