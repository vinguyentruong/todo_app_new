import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/di/injection.dart';
import 'package:todo_app/pages/todo/bloc/todo_cubit.dart';

import '../../common/event/event_bus_mixin.dart';
import '../complete/bloc/complete_cubit.dart';
import '../complete/complete_page.dart';
import '../incomplete/bloc/incomplete_cubit.dart';
import '../incomplete/incomplete_page.dart';
import '../todo/todo_page.dart';
import 'widget/main_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with EventBusMixin {
  int _currentBottomItem = 0;

  late List<Widget> contents = <Widget>[
    const TodoPage(),
    const CompletePage(),
    const IncompletePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(create: (_) => getIt<TodoCubit>()..initData()),
        BlocProvider<CompleteCubit>(create: (_) => getIt<CompleteCubit>()..initData()),
        BlocProvider<IncompleteCubit>(create: (_) => getIt<IncompleteCubit>()..initData()),
      ],
      child: Column(
        children: <Widget>[
          Expanded(child: contents[_currentBottomItem]),
          MainBottomBar(
            onSelected: _onBottomBarItemSelected,
            currentIndex: _currentBottomItem,
          )
        ],
      ),
    );
  }

  void _onBottomBarItemSelected(int index) {
    setState(() {
      _currentBottomItem = index;
    });
  }
}
