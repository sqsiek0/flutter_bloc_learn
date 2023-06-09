import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/logic/list_todo/list_todo_cubit.dart';
import 'package:todo_app/models/todo_model.dart';

part 'counter_todo_state.dart';

class CounterTodoCubit extends Cubit<CounterTodoState> {
  final TodoListCubit todoListCubit;
  late final StreamSubscription todoListSubscription;
  final int initialCounter;

  CounterTodoCubit({required this.todoListCubit, required this.initialCounter})
      : super(CounterTodoState(todoCount: initialCounter)) {
    todoListSubscription = todoListCubit.stream.listen((event) {
      final int counterValue = event.todos
          .where((element) => element.isCompleted == false)
          .toList()
          .length;

      emit(CounterTodoState(todoCount: counterValue));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
