import 'package:flutter/widgets.dart';

import '../../util/route.dart';
import 'sample_page.dart';

class SampleRoute implements AppRoute {
  @override
  final path = '/sample';

  @override
  WidgetBuilder pageBuilder = (context) => const SamplePage();
}
