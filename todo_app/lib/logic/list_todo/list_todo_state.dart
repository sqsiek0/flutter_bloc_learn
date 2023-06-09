// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'list_todo_cubit.dart';

class TodoListState extends Equatable {
  final List<ToDo> todos;

  const TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      ToDo(id: "0", todoName: "Posprzataj"),
      ToDo(id: "1", todoName: "Poucz sie"),
    ]);
  }

  @override
  List<Object> get props => [todos];
}
