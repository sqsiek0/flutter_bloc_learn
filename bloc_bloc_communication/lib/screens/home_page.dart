import 'package:bloc_bloc_communication/logic/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bloc/counter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counterSize = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeBloc, ThemeState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          counterSize = 1;
        } else if (state.color == Colors.blue) {
          counterSize = 10;
        } else if (state.color == Colors.green) {
          counterSize = 100;
        } else if (state.color == Colors.black) {
          counterSize = -100;
          BlocProvider.of<CounterBloc>(context)
              .add(ChangeCounterEvent(counterSize: counterSize));
        }
      },
      child: SafeArea(child: BlocBuilder<ThemeBloc, ThemeState>(
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
                        style:
                            const TextStyle(fontSize: 52, color: Colors.white),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(ChangeCounterEvent(counterSize: counterSize));
                      },
                      child: const Text("Change value"))
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
