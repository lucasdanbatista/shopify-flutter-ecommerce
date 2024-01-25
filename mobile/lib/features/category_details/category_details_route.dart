import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../util/route.dart';
import 'category_details_page.dart';

class CategoryDetailsRoute implements AppRoute {
  @override
  final path = '/category-details';

  @override
  WidgetBuilder pageBuilder = (context) => CategoryDetailsPage(
        args: ModalRoute.of(context)!.settings.arguments
            as CategoryDetailsArguments,
        viewModel: GetIt.I(),
      );
}
