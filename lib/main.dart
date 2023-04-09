import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'refreshing_bloc.dart';
import 'pages/metro.dart';
import 'states/refreshing_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staggered Grid View Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),

      home: MultiBlocProvider(
        providers: [
          BlocProvider<RefreshingBloc>(
            create: (_) => RefreshingBloc(RefreshingState(RefreshingStates.refreshing)),
          ),
        ],
        child: const MetroPage(),
      ),
    );
  }
}
