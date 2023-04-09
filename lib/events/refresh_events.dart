import '../events/event.dart';

class Refresh<T> extends Event<T> {
  T? _data;
  Refresh();
  @override
  T? getData() {
    return _data;
  }

  @override
  Refresh<T> setData([T? data]) {
    _data = data;
    return this;
  }


}
