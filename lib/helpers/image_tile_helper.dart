import '../interfaces/i_iterator.dart';

class ImageTileHelper implements IIterator {

  final int id;
  int _counter = 1;
  late String? uuid = "";

  ImageTileHelper(this.id);

  @override
  void setUuid(final String? uuid) {
    this.uuid = uuid;
  }

  @override
  dynamic next(final String? uuid_) {
    if ((uuid == uuid_) || (uuid_ == null)) {
      _counter++;
      if (_counter == 16) {
        _counter = 1;
      }
    }
    return (id + 1) * _counter;
  }
}

