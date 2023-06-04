import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/models/todo_model.dart';

part 'list_todo_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String newTodo) {
    final addingTodo = ToDo(todoName: newTodo);
    final newTodoList = [...state.todos, addingTodo];
    emit(TodoListState(todos: newTodoList));
  }

  void editTodo(String idTodo, String editTodo) {
    int todoIndex = state.todos.indexWhere((ToDo todo) => idTodo == todo.id);
    if (todoIndex != -1) {
      state.todos[todoIndex] = ToDo(
          id: idTodo,
          todoName: editTodo,
          isCompleted: state.todos[todoIndex].isCompleted);
    }

    emit(TodoListState(todos: state.todos));
  }

  void completeTodo(String completeId) {
    int todoIndex =
        state.todos.indexWhere((ToDo todo) => completeId == todo.id);
    if (todoIndex != -1) {
      state.todos[todoIndex] = ToDo(
          id: completeId,
          todoName: state.todos[todoIndex].todoName,
          isCompleted: !state.todos[todoIndex].isCompleted);
    }

    emit(TodoListState(todos: state.todos));
  }

//TODO: Może zmienić jak nie zadziała na całe ToDo -> lekcja 37
  void removeTodo(String removeId) {
    int todoIndex = state.todos.indexWhere((ToDo todo) => todo.id == removeId);
    if (todoIndex != -1) {
      state.todos.removeAt(todoIndex);
    }

    emit(TodoListState(todos: state.todos));
  }
}
