import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/auth_manager.dart';
import '../../util/router.gr.dart';

class ProfilePage extends StatelessWidget {
  final authManager = GetIt.I<AuthManager>();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
          onPressed: () async {
            await authManager.signOut();
            if (context.mounted) {
              context.replaceRoute(SignInRoute());
            }
          },
          child: const Text('SAIR'),
        ),
      ],
    );
  }
}
