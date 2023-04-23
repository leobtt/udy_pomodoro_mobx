import 'package:mobx/mobx.dart';

part 'count.store.g.dart';

class CountStore = _CountStore with _$CountStore;

abstract class _CountStore with Store {
  @observable
  int counter = 0;

  @action
  increment() => counter++;
}
