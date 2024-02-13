import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/home_section_dto.dart';

part 'home_provider.g.dart';

@RestApi(baseUrl: '/v1/home')
abstract class HomeProvider {
  factory HomeProvider(Dio dio) = _HomeProvider;

  @GET('/sections')
  Future<List<HomeSectionDTO>> getSections();
}
