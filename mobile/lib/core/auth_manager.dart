import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../network/web_services/customer_web_service.dart';

abstract interface class AuthManager {
  Future<void> signIn(String email, String password);

  bool get isAuthenticated;

  Future<void> loadCredentials();
}

class DefaultAuthManager implements AuthManager {
  static const _authorizationHeader = 'Authorization';
  static const _accessTokenKey = 'customer.accessToken';

  final CustomerWebService _service;
  final FlutterSecureStorage _secureStorage;
  final Dio _httpClient;

  DefaultAuthManager(this._httpClient, this._service, this._secureStorage);

  @override
  Future<void> signIn(String email, String password) async {
    final token = await _service.signIn(email, password);
    await _secureStorage.write(key: _accessTokenKey, value: token.accessToken);
    await loadCredentials();
  }

  @override
  Future<void> loadCredentials() async {
    final accessToken = await _secureStorage.read(key: _accessTokenKey);
    _httpClient.options.headers[_authorizationHeader] =
        accessToken != null ? 'Bearer $accessToken' : null;
  }

  @override
  bool get isAuthenticated =>
      _httpClient.options.headers[_authorizationHeader] != null;
}
