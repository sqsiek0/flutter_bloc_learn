import 'package:anonymous_route/logic/counter/counter_cubit.dart';
import 'package:anonymous_route/screens/counter_screen.dart';
import 'package:anonymous_route/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainClass());
}

class MainClass extends StatefulWidget {
  const MainClass({super.key});

  @override
  State<MainClass> createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  final CounterCubit counterCubit = CounterCubit();

  @override
  void dispose() {
    counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => BlocProvider.value(
              value: counterCubit,
              child: const HomePage(),
            ),
        "/counter": (context) => BlocProvider.value(
              value: counterCubit,
              child: const CounterScreen(),
            )
      },
    );
  }
}

/*
Anonymous method - with BlocProvider and BlocProvider.value to another screen
Named method - with routes and BlocProvider.value in it, create and dispose cubit/bloc var
Generated method - similar to named
*/
