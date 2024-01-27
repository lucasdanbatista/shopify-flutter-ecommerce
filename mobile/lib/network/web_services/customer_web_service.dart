import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/auth_token_dto.dart';

part 'customer_web_service.g.dart';

@RestApi(baseUrl: '/v1/customers')
abstract class CustomerWebService {
  factory CustomerWebService(Dio dio) = _CustomerWebService;

  @MultiPart()
  @POST('/sign-in')
  Future<AuthTokenDTO> signIn(
    @Part(name: 'email') String email,
    @Part(name: 'password') String password,
  );
}
