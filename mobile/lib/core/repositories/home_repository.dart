import '../../mappers/home_section_mapper.dart';
import '../../providers/home_provider.dart';
import '../entities/home_section.dart';

abstract interface class HomeRepository {
  Future<List<HomeSection>> getSections();
}

class DefaultHomeRepository implements HomeRepository {
  final HomeProvider _provider;
  final HomeSectionMapper _sectionMapper;

  DefaultHomeRepository(this._provider, this._sectionMapper);

  @override
  Future<List<HomeSection>> getSections() async {
    final response = await _provider.getSections();
    return response.map(_sectionMapper.toEntity).toList();
  }
}
