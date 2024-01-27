import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: CategoryDetailsRoute.page),
        AutoRoute(page: ProductDetailsRoute.page),
        AutoRoute(page: CartRoute.page),
      ];
}
