import 'interfaces/i_iterator.dart';

class CustomGridTile {
  CustomGridTile(this.crossAxisCount, this.mainAxisCount);

  CustomGridTile add(IIterator iterator) {
    this.iterator = iterator;
    return this;
  }

  final int crossAxisCount;
  final int mainAxisCount;
  late  IIterator iterator;

}
