import 'package:flutter/material.dart';

abstract interface class AppRoute {
  String get path;

  WidgetBuilder get pageBuilder;
}

abstract interface class RouteArguments {}

extension AppRouter on BuildContext {
  Future<T?> pushRoute<T>(AppRoute route, {RouteArguments? args}) async {
    return Navigator.of(this).pushNamed<T>(
      route.path,
      arguments: args,
    );
  }
}
