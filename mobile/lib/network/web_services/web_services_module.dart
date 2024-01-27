import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core/environment.dart';
import '../../core/module.dart';
import 'cart_web_service.dart';
import 'checkout_web_service.dart';
import 'customer_web_service.dart';
import 'product_category_web_service.dart';
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
    i.registerLazySingleton(() => CustomerWebService(i.get()));
    i.registerLazySingleton(() => ProductWebService(i.get()));
    i.registerLazySingleton(() => ProductCategoryWebService(i.get()));
    i.registerLazySingleton(() => CartWebService(i.get()));
    i.registerLazySingleton(() => CheckoutWebService(i.get()));
  }
}
