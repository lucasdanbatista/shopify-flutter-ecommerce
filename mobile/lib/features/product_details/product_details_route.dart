import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../util/route.dart';
import 'product_details_page.dart';

class ProductDetailsRoute implements AppRoute {
  @override
  final path = '/product_details';

  @override
  WidgetBuilder pageBuilder = (context) => ProductDetailsPage(
        args: ModalRoute.of(context)!.settings.arguments
            as ProductDetailsArguments,
        viewModel: GetIt.I(),
      );
}
