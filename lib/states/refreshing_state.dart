import '../custom_grid_tile.dart';

enum RefreshingStates { refreshing }

int state_(RefreshingStates state) {
  return state.index;
}

class RefreshingState {
  final RefreshingStates _state;
  String? _data;

  RefreshingState(this._state) {
    _data = null;
  }

  RefreshingStates state() {
    return _state;
  }
  
  void setData(String? data) {
    _data = data;
  }

  String? data() {
    return _data;
  }
}
