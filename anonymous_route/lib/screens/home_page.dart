import 'package:anonymous_route/logic/counter/counter_cubit.dart';
import 'package:anonymous_route/screens/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counter');
                },
                child: const Text("Show me counter")),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).incrementCounter();
                  print(BlocProvider.of<CounterCubit>(context).state.counter);
                },
                child: const Text("Increment counter")),
          ],
        ),
      ),
    ));
  }
}
