import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/counter/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Text(state.counter.toString());
        },
      )),
    ));
  }
}
