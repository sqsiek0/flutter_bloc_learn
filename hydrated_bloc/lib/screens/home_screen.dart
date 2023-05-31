import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_test/logic/change_theme/theme_bloc.dart';

import '../logic/counter/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 52),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent());
            },
            child: const Icon(Icons.mode_night_outlined),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
            },
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
            },
            child: const Icon(Icons.exposure_minus_1),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              HydratedBloc.storage.clear();
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    ));
  }
}
