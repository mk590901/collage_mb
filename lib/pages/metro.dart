import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/common.dart';
import '/custom_grid_tile.dart';
import '../helpers/image_tile_helper.dart';
import '../events/refresh_events.dart';
import '../refreshing_bloc.dart';
import '../src/widgets/staggered_grid.dart';
import '../src/widgets/staggered_grid_tile.dart';

class MetroPage extends StatelessWidget {
  const MetroPage({
    Key? key,
  }) : super(key: key);

  static final tiles = [
    CustomGridTile(2, 2),
    CustomGridTile(2, 1),
    CustomGridTile(1, 2),
    CustomGridTile(1, 1),
    CustomGridTile(2, 2),
    CustomGridTile(1, 2),
    CustomGridTile(1, 1),
    CustomGridTile(3, 1),
    CustomGridTile(1, 1),
    CustomGridTile(4, 1),
  ];

  void refresh_(BuildContext context) {
    context.read<RefreshingBloc>().add(Refresh().setData());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Collage via BLoC',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          refresh_(context);
        },
        tooltip: 'Refresh page',
        child: const Icon(Icons.refresh),
      ),
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            ...tiles.mapIndexed((index, tile) {
              return StaggeredGridTile.count(
                crossAxisCellCount: tile.crossAxisCount,
                mainAxisCellCount: tile.mainAxisCount,
                child: ImageTile(
                  width: tile.crossAxisCount * 100,
                  height: tile.mainAxisCount * 100,
                ).add(ImageTileHelper(index)),
              );
            }),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
