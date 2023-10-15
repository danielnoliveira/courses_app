import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int index = 0;

  Future<void> setIndex(int newIndex) async {
    index = newIndex;
  }
}
