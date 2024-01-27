import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/web_services/customer_web_service.dart';

abstract interface class AuthManager {
  Future<void> signIn(String email, String password);
}

class DefaultAuthManager implements AuthManager {
  final CustomerWebService _service;

  DefaultAuthManager(this._service);

  @override
  Future<void> signIn(String email, String password) async {
    final token = await _service.signIn(email, password);
    GetIt.I<Dio>().options.headers['Authorization'] =
        'Bearer ${token.accessToken}';
  }
}
