import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core/environment.dart';
import '../../core/module.dart';
import 'product_web_service.dart';

class WebServicesModule implements Module {
  @override
  void init(GetIt i) {
    i.registerLazySingleton(
      () => Dio(
        BaseOptions(
          baseUrl: i.get<Environment>().apiBaseUrl.toString(),
        ),
      ),
    );
    i.registerLazySingleton(() => ProductWebService(i.get()));
  }
}
