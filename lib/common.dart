import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'events/refresh_events.dart';
import 'interfaces/i_iterator.dart';
import 'refreshing_bloc.dart';
import 'states/refreshing_state.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.title,
    this.topPadding = 0,
    required this.child,
    required this.floatingActionButton,
  }) : super(key: key);

  final String title;
  final Widget child;
  final Widget floatingActionButton;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: child,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

class ImageTile extends StatelessWidget {
  ImageTile({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String uuid = const Uuid().v4().toString();
  final int width;
  final int height;
  late IIterator iterator;

  void refresh(BuildContext context) {
    context.read<RefreshingBloc>().add(Refresh().setData(uuid));
  }

  ImageTile add(IIterator iterator) {
    this.iterator = iterator;
    this.iterator.setUuid(uuid);
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerDown: (e) {},
        onPointerMove: (e) {},
        onPointerUp: (e) {
          refresh(context);
        },
        onPointerCancel: (e) {},
        child:
            BlocBuilder<RefreshingBloc, RefreshingState>(builder: (ctx, state) {
          return Image.network(
            'https://picsum.photos/$width/$height?random=${iterator.next(state.data())}',
            width: width.toDouble(),
            height: height.toDouble(),
            fit: BoxFit.cover,
          );
        }),
      ),
    );
  }
}
