import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/logic/change_search/change_search_cubit.dart';
import 'package:todo_app/logic/list_todo/list_todo_cubit.dart';
import 'package:todo_app/logic/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app/models/todo_model.dart';

part 'filter_list_state.dart';

class FilterListCubit extends Cubit<FilterListState> {
  final TodoListCubit todoListCubit;
  final ChangeSearchCubit changeSearchCubit;
  final TodoFilterCubit todoFilterCubit;
  final List<ToDo> initialTodo;

  late StreamSubscription todoListSubscription;
  late StreamSubscription changeSearchSubscription;
  late StreamSubscription todoFilsterSubscription;

  FilterListCubit(
      {required this.todoListCubit,
      required this.changeSearchCubit,
      required this.todoFilterCubit,
      required this.initialTodo})
      : super(FilterListState(filteredList: initialTodo)) {
    todoListSubscription = todoListCubit.stream.listen((event) {
      changeList();
    });

    changeSearchSubscription = changeSearchCubit.stream.listen((event) {
      changeList();
    });

    todoFilsterSubscription = todoFilterCubit.stream.listen((event) {
      changeList();
    });
  }

  void changeList() {
    List<ToDo> filteredList;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filteredList = todoListCubit.state.todos
            .where((element) => element.isCompleted == false)
            .toList();
        break;
      case Filter.done:
        filteredList = todoListCubit.state.todos
            .where((element) => element.isCompleted == true)
            .toList();
        break;
      case Filter.all:
        filteredList = todoListCubit.state.todos;
        break;
      default:
        filteredList = todoListCubit.state.todos;
        break;
    }

    if (changeSearchCubit.state.searchString.isNotEmpty) {
      filteredList = filteredList
          .where((element) => element.todoName
              .toLowerCase()
              .contains(changeSearchCubit.state.searchString))
          .toList();
    }

    emit(FilterListState(filteredList: filteredList));
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    changeSearchSubscription.cancel();
    todoFilsterSubscription.cancel();
    return super.close();
  }
}
