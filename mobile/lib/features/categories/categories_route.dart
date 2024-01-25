import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../util/route.dart';
import 'categories_page.dart';

class CategoriesRoute implements AppRoute {
  @override
  final path = '/categories';

  @override
  WidgetBuilder pageBuilder = (context) => CategoriesPage(
        viewModel: GetIt.I(),
      );
}
