import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final initialPage = 1;

  @observable
  late var currentPageIndex = initialPage;

  @computed
  String get pageTitle => switch (currentPageIndex) {
        0 => 'Categorias',
        1 => 'Catálogo',
        2 => 'Minha conta',
        _ => throw UnimplementedError(),
      };

  @action
  void setCurrentPageIndex(int value) => currentPageIndex = value;
}
