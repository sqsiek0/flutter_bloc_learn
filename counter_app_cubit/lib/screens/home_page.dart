import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_course/logic/couter/couter_cubit.dart';
import 'package:udemy_course/screens/screen_when_negative_number.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<CouterCubit, CounterState>(
          builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 52),
            );
          },
          listener: (context, state) {
            if (state.counter == 3) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Duża wartość licznika"),
                    content: Text("Counter: ${state.counter}"),
                  );
                },
              );
            } else if (state.counter == -1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MinusScreen(),
                  ));
            }
          },
        ),
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "decrement",
              onPressed: () {
                BlocProvider.of<CouterCubit>(context).decrement();
              },
              child: const Text("-"),
            ),
            const SizedBox(
              width: 16,
            ),
            FloatingActionButton(
              heroTag: "increment",
              onPressed: () {
                BlocProvider.of<CouterCubit>(context).increment();
              },
              child: const Text("+"),
            )
          ],
        ),
      ),
    );
  }
}
