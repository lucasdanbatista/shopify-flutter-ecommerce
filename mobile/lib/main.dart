import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'core/core_module.dart';
import 'core/module.dart';
import 'features/cart/cart_module.dart';
import 'features/categories/categories_module.dart';
import 'features/category_details/category_details_module.dart';
import 'features/product_details/product_details_module.dart';
import 'features/sign_in/sign_in_module.dart';
import 'mappers/mappers_module.dart';
import 'network/web_services/web_services_module.dart';
import 'util/router.dart';

final router = AppRouter();

void main() {
  Intl.defaultLocale = 'pt_BR';
  Module.initAll([
    CoreModule(),
    MappersModule(),
    WebServicesModule(),
    SignInModule(),
    CategoriesModule(),
    CategoryDetailsModule(),
    ProductDetailsModule(),
    CartModule(),
  ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      routerConfig: router.config(),
    );
  }
}
