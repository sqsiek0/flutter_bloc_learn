import 'package:bloc_bloc_communication/logic/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bloc/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.color,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(ChangeThemeEvent());
                    },
                    child: const Text("Change backgroud")),
                const SizedBox(
                  height: 32,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.counter.toString(),
                      style: const TextStyle(fontSize: 52, color: Colors.white),
                    );
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(ChangeCounterEvent());
                    },
                    child: const Text("Change value"))
              ],
            ),
          ),
        );
      },
    ));
  }
}
