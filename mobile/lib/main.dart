import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'core/core_module.dart';
import 'core/module.dart';
import 'features/categories/categories_module.dart';
import 'features/categories/categories_route.dart';
import 'features/category_details/category_details_module.dart';
import 'features/category_details/category_details_route.dart';
import 'features/product_details/product_details_module.dart';
import 'features/product_details/product_details_route.dart';
import 'features/sample/sample_route.dart';
import 'mappers/mappers_module.dart';
import 'network/web_services/web_services_module.dart';
import 'util/route.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  Module.initAll([
    CoreModule(),
    MappersModule(),
    WebServicesModule(),
    CategoriesModule(),
    CategoryDetailsModule(),
    ProductDetailsModule(),
  ]);
  runApp(
    MainApp(
      routes: [
        SampleRoute(),
        CategoriesRoute(),
        CategoryDetailsRoute(),
        ProductDetailsRoute(),
      ],
    ),
  );
}

class MainApp extends StatelessWidget {
  final List<AppRoute> routes;

  const MainApp({
    super.key,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      initialRoute: routes.first.path,
      routes: routes.asMap().map((k, v) => MapEntry(v.path, v.pageBuilder)),
    );
  }
}
