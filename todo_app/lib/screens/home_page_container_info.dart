import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:bloc/bloc.dart';
import 'package:todo_app/logic/list_todo/list_todo_cubit.dart';

import '../logic/counter_todo/counter_todo_cubit.dart';

Widget todayProgress(BuildContext context) {
  final textClear = TextEditingController();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 175,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 76, 192, 238),
                Color.fromARGB(255, 20, 100, 199)
              ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Today's progress",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<CounterTodoCubit, CounterTodoState>(
                  builder: (context, state) {
                    return Text(
                      "${state.todoCount} tasks",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    );
                  },
                ),
                BlocBuilder<TodoListCubit, TodoListState>(
                  builder: (context, state) {
                    int percValueUp = state.todos
                        .where((element) => element.isCompleted == true)
                        .toList()
                        .length;
                    int percValueDown = state.todos.length;
                    double percValue = percValueUp / percValueDown;
                    print(percValue);
                    return LinearPercentIndicator(
                      width: 120,
                      percent: percValue,
                      progressColor: Colors.white,
                      barRadius: const Radius.circular(8),
                      animation: true,
                      trailing: Text(
                        "${(percValue * 100).toInt()}%",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              style: const TextStyle(color: Colors.white, fontSize: 18),
              strutStyle: const StrutStyle(),
              controller: textClear,
              decoration: InputDecoration(
                  hintText: "Enter what ToDo",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  suffixIcon: Icon(
                    Icons.send,
                    color: Colors.white.withOpacity(0.6),
                  )),
              onSubmitted: (value) {
                BlocProvider.of<TodoListCubit>(context).addTodo(value);
                textClear.clear();
              },
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ],
        ),
      ),
    ),
  );
}
