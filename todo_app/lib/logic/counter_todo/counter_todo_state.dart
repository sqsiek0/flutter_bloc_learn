// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_todo_cubit.dart';

class CounterTodoState extends Equatable {
  final int todoCount;

  const CounterTodoState({
    required this.todoCount,
  });

  factory CounterTodoState.initial() {
    return const CounterTodoState(todoCount: 0);
  }

  @override
  List<Object> get props => [todoCount];
}
