import 'package:get_it/get_it.dart';

abstract interface class Module {
  void init(GetIt i);

  static void initAll(List<Module> modules) {
    for (final module in modules) {
      module.init(GetIt.instance);
    }
  }
}
