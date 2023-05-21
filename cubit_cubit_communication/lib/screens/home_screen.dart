import 'package:cubit_cubit_communication/logic/counter_value/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/change_background/background_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<BackgroundCubit, BackgroundState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.color,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<BackgroundCubit>(context)
                          .changeColor(state.color);
                    },
                    child: const Text("Change backgroud")),
                const SizedBox(
                  height: 32,
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Text(
                      BlocProvider.of<CounterCubit>(context)
                          .state
                          .counter
                          .toString(),
                      style: const TextStyle(fontSize: 52, color: Colors.white),
                    );
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).changeCounter();
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
