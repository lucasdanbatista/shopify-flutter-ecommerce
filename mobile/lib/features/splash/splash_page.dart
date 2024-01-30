import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/auth_manager.dart';
import '../../main.dart';
import '../../util/assets.dart';
import '../../util/cron.dart';
import '../../util/init_state_mixin.dart';
import '../../util/router.gr.dart';

@RoutePage()
class SplashPage extends StatelessWidget with InitStateMixin {
  final authManager = GetIt.I<AuthManager>();

  SplashPage({super.key});

  @override
  void initState() async {
    await Future.delayed(1.seconds);
    final route = authManager.isAuthenticated ? CategoriesRoute() : SignInRoute();
    router.replace(route as PageRouteInfo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Wrap(
          spacing: 24,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: [
            Image.asset(
              ImageAssets.storeLogo,
              height: 150,
            ),
            const SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
