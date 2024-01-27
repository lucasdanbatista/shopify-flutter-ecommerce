import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'sign_in_view_model.dart';

class SignInModule implements Module {
  @override
  void init(GetIt i) {
    i.registerFactory(() => SignInViewModel());
  }
}